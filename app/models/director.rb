class Director < Person
  attr_accessible :movies_attributes, :movies

  has_many :movies

  accepts_nested_attributes_for :movies
end
