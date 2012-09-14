class Disc < ActiveRecord::Base
  attr_accessible :name, :release_date, :summary, :asin

  validates :name, :summary, :presence => true
  validates_uniqueness_of :name
  validate  :release_date_is_not_future

  has_many    :actors
  belongs_to  :director

  def release_date_is_not_future
    errors.add(:release_date, "%{attribute} must not be in the future.") unless release_date.nil? || release_date <= Date.today
  end
end
