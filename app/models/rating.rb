class Rating < ActiveRecord::Base
  validates :user, :presence => true
  validates :rating, :presence => false


  belongs_to :wine
  belongs_to :user


end
