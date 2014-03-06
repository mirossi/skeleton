class Person < ActiveRecord::Base
  has_one :contact
  belongs_to :user
end
