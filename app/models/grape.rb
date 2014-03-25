class Grape < ActiveRecord::Base
  validates :name, length: { minimum: 3 },uniqueness: true
  
  has_many :wine_has_grapes
  has_many :wines, through: :wine_has_grapes
  accepts_nested_attributes_for :wines
  
  def self.find_or_create name
    g= Grape.find_by_name(name)
    if(g.nil?)
      g=Grape.new
      g.name=name
      g.save
    end
    return g
  end
  
  
end
