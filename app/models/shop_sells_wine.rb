class ShopSellsWine < ActiveRecord::Base
  validates :price,  :numericality => { :greater_than => 0}
  
  belongs_to :wine
  belongs_to :shop
end
