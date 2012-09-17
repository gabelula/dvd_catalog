require 'acts_as_amazon_product'

class Disc < ActiveRecord::Base
  attr_accessible :name, :release_date, :summary, :asin, :director_id, :actors_attributes, :acts_attributes, :director

  validates :name, :summary, :presence => true
  validates_uniqueness_of :name
  validate  :release_date_is_not_future

  has_many    :acts, :dependent => :destroy
  has_many    :actors, :through => :acts

  belongs_to  :director

  accepts_nested_attributes_for :acts,    :allow_destroy => true
  accepts_nested_attributes_for :actors

  before_save :load_amazon_dvd unless asin.nil?

  acts_as_amazon_product :asin => 'asin', :access_key => 'AKIAJQLNGTRJF54F2W7A'

  private

  def release_date_is_not_future
    errors.add(:release_date, " must not be in the future.") unless release_date.nil? || release_date <= Date.today
  end

  def get_amazon
    #look at https://github.com/ryandotsmith/bookup/tree/a89e08cb967022ff0643d3204a077a155d6f2009/vendor/plugins/amazon_products
    #
  end
end
