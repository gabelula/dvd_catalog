Factory.define :person do |p|
  p.add_attribute :name, 'Maria Rodriguez'
  p.add_attribute :birth_date, Date.new(1977, 3, 2)
  p.add_attribute :gender, 'F'
end