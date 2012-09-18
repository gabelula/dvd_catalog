class Disc < ActiveRecord::Base
  attr_accessible :name, :release_date, :summary, :asin, :amazon_link, :director_id, :actors_attributes, :acts_attributes, :director

  validates :name, :summary, :presence => true
  validates_uniqueness_of :name
  validate  :release_date_is_not_future

  has_many    :acts, :dependent => :destroy
  has_many    :actors, :through => :acts

  belongs_to  :director

  accepts_nested_attributes_for :acts,    :allow_destroy => true
  accepts_nested_attributes_for :actors

  before_save :get_amazon_info

  def get_amazon_info
    unless asin.nil?
      items = self.amazon_client.lookup(asin)

      amazon_link = items.first.raw.DetailPageURL unless items.empty?
    end
  end

  def amazon_client
    return ASIN::Client.instance
  end

  private

  def release_date_is_not_future
    errors.add(:release_date, " must not be in the future.") unless release_date.nil? || release_date <= Date.today
  end

end
