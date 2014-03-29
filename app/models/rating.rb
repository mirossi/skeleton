class Rating < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :rating, :presence => false


  belongs_to :wine


end
