require 'faker'

FactoryBot.define do
    factory :event do
      title { Faker::Lorem.word }
      description { Faker::Lorem.sentence }
      location { Faker::Address.city}
      start_date { Faker::Time.between(from: DateTime.now, to: DateTime.now + 7) }
      end_date { Faker::Time.between(from: DateTime.now + 8, to: DateTime.now + 14) }
      association :user, factory: :user
    end
  end
  