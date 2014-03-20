class Wine < ActiveRecord::Base
  validates :name, length: { minimum: 3 }

  has_many :wine_has_images
  has_many :images, through: :wine_has_images
  belongs_to :user

  accepts_nested_attributes_for  :images
end
