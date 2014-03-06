class Person < ActiveRecord::Base
  validates :lastname, length: { minimum: 3 }
  validates :firstname, length: { minimum: 3 }
  
 
  has_one :contact
  belongs_to :user
end
