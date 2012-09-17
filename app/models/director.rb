class Director < Person
  attr_accessible :discs_attributes, :discs

  has_many :discs, :dependent => :nullify

  accepts_nested_attributes_for :discs
end
