class Shop < ActiveRecord::Base
    validates :name, length: { minimum: 3 }
    belongs_to :user
end
