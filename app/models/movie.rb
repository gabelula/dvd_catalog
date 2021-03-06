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

  # Gets information from amazon
  # before_save :get_amazon_info

  scoped_search :on => :name, :complete_value => true, :default_order => true
  scoped_search :in => :actors, :on => :name, :complete_value => true
  scoped_search :in => :director, :on => :name, :complete_value => true

  def get_amazon_info
    unless asin == "" || asin.nil?
      items = self.amazon_client.lookup(asin)

      amazon_link = items.first.raw.DetailPageURL unless items.empty?
    end
    return true
  end

  def amazon_client
    return ASIN::Client.instance
  end

  private

  def release_date_is_not_future
    errors.add(:release_date, " must not be in the future.") unless release_date.nil? || release_date <= Date.today
  end

end
