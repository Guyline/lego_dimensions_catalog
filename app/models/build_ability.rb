# == Schema Information
#
# Table name: build_abilities
#
#  id         :integer          not null, primary key
#  build_id   :integer
#  ability_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class BuildAbility < ActiveRecord::Base
  belongs_to          :build
  belongs_to          :ability
end
