namespace :packs do
  desc "TODO"
  task :optimize, [:last_wave, :included_levels] => :environment do |t, args|
    possible_included_levels = ["starter", "all"]
    included_levels = possible_included_levels.include?(args[:included_levels]) ? args[:included_levels] : "all"
    puts "Searching abilities required for #{possible_included_levels} levels.."
    highest_last_wave = Wave.maximum(:number) || 0
    last_wave = [highest_last_wave, (args[:last_wave] || 1).to_i].min
    puts "Using sets from waves 1 through #{last_wave}..."

    waves = Wave.where("waves.number <= ?", last_wave)
    packs = Pack.where(:wave => waves)

    starter_pack = Pack::Starter.first
    raise "No starter pack found" unless starter_pack.present?

    levels = nil
    case included_levels
    when "starter"
      levels = starter_pack.levels
    when "all"
      levels = Level.where(:pack => packs).uniq
    end
    level_abilities = LevelAbility.where(:level => levels)
    # abilities = Ability.where(:id => level_abilities.pluck(:ability_id)).uniq
    abilities = Ability.required
    ability_ids = abilities.pluck(:id).sort
    puts "ABILITY IDS: #{ability_ids}"
    puts "REQUIRED ABILITIES: #{Ability.where(:id => ability_ids).pluck(:name)}"
    puts "\n********************\n\n"

    default_pack_configuration = {
      :ability_ids => starter_pack.ability_ids,
      :pack_ids => [starter_pack.id],
      :cost => starter_pack.price,
      :completed => false
    }
    pack_configurations = [default_pack_configuration]
    packs.find_each do |pack|
      # puts "PACK ##{pack.id} => #{pack_configurations.inspect}"
      # Get the pack's ability IDs relevant to our desired ability IDs
      pack_ability_ids = pack.ability_ids & ability_ids
      # puts "  Ability IDs: #{pack_ability_ids}"
      # Find all uncompleted packs
      uncompleted_pack_configurations = pack_configurations.select{ |pack_configuration| pack_configuration[:completed] == false }.deep_dup
      uncompleted_pack_configurations.each do |pack_configuration|
        # puts "  Configuration: #{pack_configuration.inspect}"
        # For each uncompleted pack, find all
        pack_configuration_ability_ids = pack_configuration[:ability_ids]
        new_pack_configuration_ability_ids = (pack_configuration_ability_ids | pack_ability_ids).uniq.sort
        # puts "    New Configuration Ability IDs: #{new_pack_configuration_ability_ids}"
        # If the pack has abilities that aren't included in the configuration, duplicate the configuration
        #   and add the new pack to it
        if new_pack_configuration_ability_ids != pack_configuration_ability_ids
          new_pack_configuration = pack_configuration.deep_dup
          new_pack_configuration[:ability_ids] = new_pack_configuration_ability_ids
          new_pack_configuration[:pack_ids] << pack.id
          new_pack_configuration[:pack_ids].sort!
          new_pack_configuration[:cost] += pack.price.to_f
          # If the new configuration has all of the abilities, mark it as completed
          new_pack_configuration[:completed] = (new_pack_configuration_ability_ids & ability_ids) == ability_ids

          pack_configurations << new_pack_configuration
          # puts "*** NEW CONFIGURATION ADDED: #{new_pack_configuration} ***"
        end
      end
      puts "PACK CONFIGURATIONS: #{pack_configurations}\n\n"
    end

    # puts "ALL PACK CONFIGURATIONS: #{pack_configurations.inspect}\n\n"
    completed_pack_configurations = pack_configurations.select{ |pack_configuration| pack_configuration[:completed] }
    puts "COMPLETED PACK CONFIGURATIONS: #{completed_pack_configurations}\n\n"
    minimum_cost = completed_pack_configurations.map{ |pack_configuration| pack_configuration[:cost] }.min

    if minimum_cost.present?
      best_pack_configurations = completed_pack_configurations.select{ |pack_configuration| pack_configuration[:cost] == minimum_cost }
      best_pack_configuration_pack_ids = best_pack_configurations.map{ |pack_configuration| pack_configuration[:pack_ids] }
      best_pack_configuration_pack_names = best_pack_configuration_pack_ids.map{ |pack_ids| Pack.where(:id => pack_ids).pluck(:name) }
      puts "BEST PACK CONFIGURATIONS: #{best_pack_configuration_pack_names}"
      puts "TOTAL COST: $#{minimum_cost.round(2)}"
    else
      puts "IT CAN'T BE DONE!!"
    end

  end

end
