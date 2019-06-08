FactoryBot.define do
  factory :matriculation do
    total { Faker::Number.decimal(3, 2) }
    invoice { Faker::Number.between(1, 12) }
    invoice_expire_at { Faker::Number.between(1, 28) }
    course_name { Faker::Lorem.words }
    association :student, :institution, strategy: :build
  end
end
