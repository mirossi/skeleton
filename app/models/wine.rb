class Wine < ActiveRecord::Base
  validates :name, length: { minimum: 3 }

  has_many :wine_has_grapes
  has_many :wine_has_images
  has_many :images, through: :wine_has_images
  has_many :grapes, through: :wine_has_grapes
  belongs_to :user

  accepts_nested_attributes_for  :images
  accepts_nested_attributes_for  :grapes
end
