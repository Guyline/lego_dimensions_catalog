# == Schema Information
#
# Table name: dimensions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Dimension < ActiveRecord::Base
  has_many          :figurines
  has_many          :packs, -> { uniq },
    :through => :figurines
  has_many          :worlds
  has_many          :levels

  NAMES = [
    NAME_BACK_TO_THE_FUTURE = "Back to the Future",
    NAME_DC = "DC Comics",
    NAME_DOCTOR_WHO = "Doctor Who",
    NAME_GHOSTBUSTERS = "Ghostbusters",
    NAME_LEGO_MOVIE = "The LEGO Movie",
    NAME_LORD_OF_THE_RINGS = "The Lord of the Rings",
    NAME_MIDWAY = "Midway Games",
    NAME_NINJAGO = "Ninjago",
    NAME_PORTAL = "Portal",
    NAME_SCOOBY_DOO = "Scooby-Doo",
    NAME_SIMPSONS = "The Simpsons",
    NAME_WIZARD_OF_OZ = "The Wizard of Oz"
  ]
end
