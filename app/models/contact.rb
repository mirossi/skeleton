class Contact < ActiveRecord::Base
  validates :street, length: { minimum: 3 }
  validates :zip, length: { minimum: 3 }
  validates :city, length: { minimum: 3 }
  validates :mobile, length: { minimum: 3 }
  
  belongs_to :person
end
