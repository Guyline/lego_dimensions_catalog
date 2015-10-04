# == Schema Information
#
# Table name: packs
#
#  id         :integer          not null, primary key
#  wave_id    :integer
#  name       :string(255)      not null
#  set_number :integer
#  price      :decimal(5, 2)
#  pack_type  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Pack < ActiveRecord::Base
  self.inheritance_column = :pack_type

  has_many      :pack_figurines
  has_many      :figurines,
    :through => :pack_figurines
  has_many      :characters,
    :class_name => "Figurine::Character",
    :through => :pack_figurines,
    :source => :figurine
  has_many      :character_abilities, -> { uniq },
    :through => :characters,
    :source => :abilities
  has_many      :vehicles,
    :class_name => "Figurine::Vehicle",
    :through => :pack_figurines,
    :source => :figurine
  has_many      :vehicle_abilities, -> { uniq },
    :through => :vehicles,
    :source => :abilities
  has_many      :gadgets,
    :class_name => "Figurine::Gadget",
    :through => :pack_figurines,
    :source => :figurine
  has_many      :gadget_abilities, -> { uniq },
    :through => :gadgets,
    :source => :abilities
  has_many      :dimensions, -> { uniq },
    :through => :figurines,
    :source => :dimension

  belongs_to    :wave

  delegate      :release_date,
    :to => :wave

  after_initialize  :set_defaults

  def set_defaults
  end

  def ability_ids
    (character_ability_ids + vehicle_ability_ids + gadget_ability_ids).uniq.sort
  end

  def abilities
    Ability.where(:id => ability_ids)
  end
end
