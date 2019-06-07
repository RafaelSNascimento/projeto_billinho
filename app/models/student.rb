class Student < ApplicationRecord
    has_many :matriculation, dependent: :destroy
    validates_presence_of :name, :cpf, :gender, :payment_type
end
