FactoryBot.define do
    acceptedGenders = ["M", "F"]
    acceptedTypes = ["Boleto", "Cartão"]
    factory :student do
        name { Faker::Name.name }
        cpf { Faker::Number.number(11) }
        dt_birth { Random.rand(20..30).years.ago }
        telephone { Faker::Number.number(4) }
        gender { acceptedGenders[Random.rand(acceptedGenders.length)] }
        payment_type { acceptedTypes[Random.rand(acceptedTypes.length)] }
    end
end