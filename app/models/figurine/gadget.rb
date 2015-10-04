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

class Figurine::Gadget < Figurine
  belongs_to      :owner,
    :class_name => "Figurine::Character"

  has_many        :builds,
    :foreign_key => :figurine_id
  has_many        :abilities, -> { uniq },
    :through => :builds
end
