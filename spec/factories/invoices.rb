FactoryBot.define do
  acceptedStatus = ["Aberta", "Atrasada", "Paga", "Aberta"]
  factory :invoice do
    total { Faker::Number.decimal(3, 2) }
    expire_at { Faker::Number.between(1, 28) }
    status { acceptedStatus[Random.rand(acceptedStatus.length)] }
    association :matriculation
  end
end
