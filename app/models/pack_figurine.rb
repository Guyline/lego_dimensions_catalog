# == Schema Information
#
# Table name: pack_figurines
#
#  id          :integer          not null, primary key
#  pack_id     :integer
#  figurine_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class PackFigurine < ActiveRecord::Base
  belongs_to          :pack
  belongs_to          :figurine

  validates :pack_id,
    :presence => true
  validates :figurine_id,
    :presence => true,
    :uniqueness => {
      :scope => :pack_id
    }
end
