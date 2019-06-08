class Institution < ApplicationRecord
  has_many :matriculations, dependent: :destroy
  validates_presence_of :name, :cnpj
  validates :name, uniqueness: true
  validates :cnpj, uniqueness: true, numericality: { only_integer: true }
  validates :is_type, acceptance: { accept: ["Universidade", "Escola", "Creche"] }
end
