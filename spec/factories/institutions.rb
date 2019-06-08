FactoryBot.define do
  acceptedNames = ["Universidade", "Escola", "Creche"]
  factory :institution do
    name { Faker::Lorem.words }
    cnpj { Faker::Number.number(11) }
    is_type { acceptedNames[Random.rand(acceptedNames.length)] }
  end
end
