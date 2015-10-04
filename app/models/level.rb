# == Schema Information
#
# Table name: levels
#
#  id           :integer          not null, primary key
#  pack_id      :integer
#  dimension_id :integer
#  name         :string(255)
#  location     :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Level < ActiveRecord::Base
  belongs_to    :pack
  belongs_to    :dimension

  has_many      :level_abilities
  has_many      :abilities,
    :through => :level_abilities
end
