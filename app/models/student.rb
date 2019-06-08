class Student < ApplicationRecord
  has_many :matriculations, dependent: :destroy
  validates_presence_of :name, :cpf, :gender, :payment_type
  validates :name, uniqueness: true
  validates :cpf, uniqueness: true, numericality: { only_integer: true }
  validates :gender, acceptance: { accept: ["M", "F"] }
  validates :payment_type, acceptance: { accept: ["Boleto", "Cartão"] }
end
