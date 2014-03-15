class PersonHasContact < ActiveRecord::Base
  belongs_to :contact
  belongs_to :person

  validates_presence_of :contact
  validates_presence_of :person

end
