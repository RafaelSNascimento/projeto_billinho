FactoryBot.define do
  factory :invoice do
    total nil
    expire_at nil
    status nil
    association :matriculation
  end
end
