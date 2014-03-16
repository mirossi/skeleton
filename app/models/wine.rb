class Wine < ActiveRecord::Base

  has_many :wine_has_images
  has_many :images, through: :wine_has_images

  accepts_nested_attributes_for  :images
end
