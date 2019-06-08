class Student < ApplicationRecord
    has_many :matriculation, dependent: :destroy
    validates_presence_of :name, :cpf, :gender, :payment_type
    validates :gender, acceptance: { accept: ['M', 'F'] }
    validates :payment_type, acceptance: { accept: ['Boleto', 'Cartão'] }
end
