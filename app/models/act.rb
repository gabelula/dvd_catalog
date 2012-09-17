class Act < ActiveRecord::Base
  attr_accessible :actor_id, :disc_id
  belongs_to :actor
  belongs_to :disc
end
