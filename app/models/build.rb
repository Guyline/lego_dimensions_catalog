# == Schema Information
#
# Table name: builds
#
#  id          :integer          not null, primary key
#  figurine_id :integer
#  name        :string(255)
#  version     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Build < ActiveRecord::Base
  has_many            :build_abilities
  has_many            :abilities,
    :through => :build_abilities

  belongs_to          :figurine
end
