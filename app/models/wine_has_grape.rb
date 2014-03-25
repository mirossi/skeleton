class WineHasGrape < ActiveRecord::Base
  belongs_to :wine
  belongs_to :grape

  validates_presence_of :wine
  validates_presence_of :grape
  
end
