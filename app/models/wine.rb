class Wine < ActiveRecord::Base
  validates :name, length: { minimum: 3 }
  


  has_many :wine_likes_foods, :dependent => :destroy
  has_many :shop_sells_wines, :dependent => :destroy
  has_many :wine_has_grapes, :dependent => :destroy
  has_many :wine_has_images, :dependent => :destroy
  has_many :images, through: :wine_has_images
  has_many :grapes, through: :wine_has_grapes
  has_many :foods, through: :wine_likes_foods
  has_many :ratings, :dependent => :destroy
  belongs_to :user

  accepts_nested_attributes_for  :shop_sells_wines
  accepts_nested_attributes_for  :images
  accepts_nested_attributes_for  :grapes
  accepts_nested_attributes_for  :foods
  accepts_nested_attributes_for  :ratings
 
  
  
end
