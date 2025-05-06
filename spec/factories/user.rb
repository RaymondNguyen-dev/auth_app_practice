FactoryBot.define do
  factory :user do
    # Use faker to create fake data
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
  end
end
