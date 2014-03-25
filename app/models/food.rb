class Food < ActiveRecord::Base
  validates :name, length: { minimum: 3 },uniqueness: true

  has_many :wine_likes_foods
  has_many :wines, through: :wine_likes_foods
  accepts_nested_attributes_for :wines

  def self.find_or_create name
    g= Food.find_by_name(name)
    if(g.nil?)
      g=Food.new
      g.name=name
      g.save
    end
    return g
  end



end
