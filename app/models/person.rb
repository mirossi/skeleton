class Person < ActiveRecord::Base
  validates :lastname, length: { minimum: 3 }
  validates :firstname, length: { minimum: 3 }
  
  has_many :person_has_contacts
  has_many :contacts, through: :person_has_contacts
  belongs_to :user

  accepts_nested_attributes_for  :contacts
  accepts_nested_attributes_for  :user
end
