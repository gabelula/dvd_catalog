class Actor < Person
  attr_accessible :roles_attributes

  has_many :roles , :dependent => :destroy
  has_many :movies, :through => :roles

  accepts_nested_attributes_for :roles, :allow_destroy => true
end
