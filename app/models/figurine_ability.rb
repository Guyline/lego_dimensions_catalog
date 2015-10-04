# == Schema Information
#
# Table name: figurine_abilities
#
#  id          :integer          not null, primary key
#  figurine_id :integer
#  ability_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class FigurineAbility < ActiveRecord::Base
  belongs_to          :figurine
  belongs_to          :ability

  validates :figurine_id,
    :presence => true
  validates :ability_id,
    :presence => true,
    :uniqueness => {
      :scope => :figurine_id
    }
end
