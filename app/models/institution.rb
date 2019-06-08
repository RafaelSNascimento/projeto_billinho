class Institution < ApplicationRecord
  has_many :matriculation, dependent: :destroy
  validates_presence_of :name, :cnpj
  validates :is_type, acceptance: { accept: ["Universidade", "Escola", "Creche"] }
end
