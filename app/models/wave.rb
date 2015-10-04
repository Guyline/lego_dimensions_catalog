# == Schema Information
#
# Table name: waves
#
#  id           :integer          not null, primary key
#  number       :integer
#  release_date :date
#  created_at   :datetime
#  updated_at   :datetime
#

class Wave < ActiveRecord::Base
  has_many        :packs
  has_many        :figurines, -> { uniq },
    :through => :packs
end
