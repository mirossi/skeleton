class Contact < ActiveRecord::Base
  validates :street, length: { minimum: 3 }
  validates :zip,  :numericality => { :greater_than => 0}
  validates :city, length: { minimum: 3 }
  validates :mobile, length: { minimum: 3 }

  has_one :person_has_contact
  has_one :person, through: :person_has_contact
  accepts_nested_attributes_for :person
end
