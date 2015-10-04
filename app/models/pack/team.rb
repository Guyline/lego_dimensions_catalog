# == Schema Information
#
# Table name: packs
#
#  id         :integer          not null, primary key
#  wave_id    :integer
#  name       :string(255)      not null
#  set_number :integer
#  price      :decimal(5, 2)
#  pack_type  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Pack::Team < Pack
  def set_defaults
    super
    self.price      ||= 24.99
  end
end
