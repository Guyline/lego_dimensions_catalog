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

class Figurine::Character < Figurine
  has_many      :figurine_abilities,
    :foreign_key => :figurine_id
  has_many      :abilities,
    :through => :figurine_abilities,
    :source => :ability

  has_many    :vehicles,
    :class_name => "Figurine::Vehicle",
    :foreign_key => :owner_id
  has_many    :gadgets,
    :class_name => "Figurine::Gadget",
    :foreign_key => :owner_id
end
