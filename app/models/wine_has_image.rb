class WineHasImage < ActiveRecord::Base
  belongs_to :wine
  belongs_to :image

  validates_presence_of :wine
  validates_presence_of :image
end
