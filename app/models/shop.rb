class Shop < ActiveRecord::Base
    validates :name, length: { minimum: 3 }
    belongs_to :user
  
    has_many :shop_sells_wines
  has_many :wines, through: :shop_sells_wines
  
  accepts_nested_attributes_for :wines
  
end
