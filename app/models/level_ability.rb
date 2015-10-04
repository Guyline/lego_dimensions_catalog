# == Schema Information
#
# Table name: level_abilities
#
#  id         :integer          not null, primary key
#  level_id   :integer
#  ability_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class LevelAbility < ActiveRecord::Base
  belongs_to        :level
  belongs_to        :ability
end
