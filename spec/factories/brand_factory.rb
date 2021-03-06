FactoryGirl.define do
  factory :brand, :class => Spree::Brand do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    enabled { true }
  end
end