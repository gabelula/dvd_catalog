class Actor < Person
  attr_accessible :acts_attributes

  has_many :acts
  has_many :discs, :through => :acts

  accepts_nested_attributes_for :acts, :allow_destroy => true
end
