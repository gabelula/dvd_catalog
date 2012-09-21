class Movie < ActiveRecord::Base
  attr_accessible :name, :release_date, :summary, :asin, :actors_attributes, :roles_attributes, :director, :director_id

  validates :name, :summary, :presence => true
  validates_uniqueness_of :name
  validate  :release_date_is_not_future

  # Relationship for the actors
  has_many    :roles
  has_many    :actors, :through => :roles

  accepts_nested_attributes_for :roles,    :allow_destroy => true
  accepts_nested_attributes_for :actors

  # Relationship for the director
  belongs_to  :director

  private

  def release_date_is_not_future
    errors.add(:release_date, " must not be in the future.") unless release_date.nil? || release_date <= Date.today
  end

end
