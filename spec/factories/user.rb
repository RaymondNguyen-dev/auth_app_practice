FactoryBot.define do
  factory :user do
    # Sử dụng Faker để tạo dữ liệu giả
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
  end
end
