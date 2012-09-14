Factory.define :disc do |d|
  d.add_attribute :name, 'Ladri di biciclette'
  d.add_attribute :release_date, Date.new(1948,1,1)
  d.add_attribute :summary, 'About a worker that needs a bike as a requirement for a job.'
  d.add_attribute :asin, '6305081034'
end
