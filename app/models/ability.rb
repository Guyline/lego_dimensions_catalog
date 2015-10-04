# == Schema Information
#
# Table name: abilities
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Ability < ActiveRecord::Base
  has_many        :figurine_abilities
  has_many        :figurines,
    :through => :figurine_abilities

  has_many        :packs, -> { uniq },
    :through => :figurines

  has_many        :level_abilities
  has_many        :levels,
    :through => :level_abilites

  NAMES = [
    NAME_ACCELERATOR = "Accelerator Switches",
    NAME_ACROBAT = "Acrobat",
    NAME_ATLANTIS = "Atlantis",
    NAME_BIG = "Big Transform",
    NAME_BOOMERANG = "Boomerang",
    NAME_CHI = "Chi",
    NAME_CRACKED_LEGO = "Cracked LEGO",
    NAME_DIG = "Dig",
    NAME_DIVE = "Dive",
    NAME_DRILL = "Drill",
    NAME_DRONE = "Drone",
    NAME_ELECTRICITY = "Electricity",
    NAME_FIXIT = "Fix-It",
    NAME_FLYING = "Flying",
    NAME_GYROSPHERE = "Gyrosphere Switch",
    NAME_GRAPPLE = "Grapple",
    NAME_GROWTH = "Growth",
    NAME_HACKING = "Hacking",
    NAME_HAZARD = "Hazard Cleanup",
    NAME_ICE_BREATH = "Ice Breath",
    NAME_ILLUMINATION = "Illumination",
    NAME_INVULNERABILITY = "Invulnerability",
    NAME_LASER = "Laser",
    NAME_LASER_DEFLECTION = "Laser Deflection",
    NAME_MAGIC = "Magic",
    NAME_MAGICAL_SHIELD = "Magical Shield",
    NAME_MASTER_BUILD = "Master Build",
    NAME_MIND_CONTROL = "Mind Control",
    NAME_MINI = "Mini Access",
    NAME_POLE_VAULT = "Pole Vault",
    NAME_PORTAL_GUN = "Portal Gun",
    NAME_RAINBOW_LEGO = "Rainbow LEGO",
    NAME_RELIC_DETECTOR = "Relic Detector",
    NAME_SILVER_LEGO = "Silver LEGO Blowup",
    NAME_SONAR = "Sonar Smash",
    NAME_SPEED = "Speed",
    NAME_SPINJUTSU = "Spinjutsu",
    NAME_STEALTH = "Stealth",
    NAME_STRENGTH = "Super Strength",
    NAME_SUSPEND_GHOST = "Suspend Ghost",
    NAME_TARGET = "Target",
    NAME_TECHNOLOGY = "Technology",
    NAME_TIME_TRAVEL = "Time Travel Switches",
    NAME_TOWBAR = "Towbar",
    NAME_TRACKING = "Tracking",
    NAME_TRAP_GHOST = "Trap Ghost",
    NAME_VINE = "Vine Cutting",
    NAME_WEIGHT = "Weight Switch",
    NAME_XRAY = "X-Ray Vision"
  ]

  # NAMES_REQUIRED = [
  #   NAME_CRACKED_LEGO,
  #   NAME_DIG,
  #   NAME_DRONE,
  #   NAME_ELECTRICITY,
  #   NAME_HACKING,
  #   NAME_HAZARD,
  #   NAME_LASER,
  #   NAME_MINI,
  #   NAME_PORTAL_GUN,
  #   NAME_RAINBOW_LEGO,
  #   NAME_SILVER_LEGO,
  #   NAME_SUSPEND_GHOST,
  #   NAME_TARGET,
  #   NAME_TOWBAR
  # ]
  #
  # scope :required, -> { where(:abilities => {:name => Ability::NAMES_REQUIRED}) }
end
