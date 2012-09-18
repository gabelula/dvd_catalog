FactoryGirl.define do

  factory :director, class: Director do
    name       'Maria Rodriguez'
    birth_date Date.new(1977, 3, 2)
    gender     'F'
  end

  factory :disc, class: Disc do
    name 'Ladri di biciclette'
    release_date Date.new(1948, 1, 1)
    summary 'About a worker that needs a bike as a requirement for a job.'
    asin '6305081034'
  end

  factory :actor, class: Actor do
    name 'Juana Perez'
    birth_date Date.new(1977, 3, 2)
    gender 'F'
  end
end
