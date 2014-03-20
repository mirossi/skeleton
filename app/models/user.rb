class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates_uniqueness_of :username, :case_sensitive => false
  validates_presence_of  :username


  has_one :person
  has_many :comments
  has_many :wines
    has_many :shops
  
  accepts_nested_attributes_for :person

end
