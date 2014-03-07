class Person < ActiveRecord::Base
  validates :lastname, length: { minimum: 3 }
  validates :firstname, length: { minimum: 3 }
  
 
  has_one :contact
  belongs_to :user
    accepts_nested_attributes_for :contact
  accepts_nested_attributes_for  :user
end
