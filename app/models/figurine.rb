# == Schema Information
#
# Table name: figurines
#
#  id            :integer          not null, primary key
#  dimension_id  :integer
#  owner_id      :integer
#  name          :string(255)      not null
#  figurine_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Figurine < ActiveRecord::Base
  self.inheritance_column = :figurine_type

  belongs_to    :dimension

  has_many      :pack_figurines
  has_many      :packs,
    :through => :pack_figurines,
    :source => :pack
end
