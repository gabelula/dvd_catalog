class Disc < ActiveRecord::Base
  attr_accessible :name, :release_date, :summary, :asin

  validates :name, :summary, :presence => true
  validates_uniqueness_of :name

  has_many    :actors
  belongs_to  :director
end
