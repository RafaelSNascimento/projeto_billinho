FactoryBot.define do
    acceptedNames = ["Universidade", "Escola", "Creche"]
    factory :institution do
        name { Faker::Name.University.name }
        cnpj { Faker::Number.number(11) }
        type { acceptedNames[Random.rand(acceptedNames.length)] }
    end
end