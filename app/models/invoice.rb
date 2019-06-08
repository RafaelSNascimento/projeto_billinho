class Invoice < ApplicationRecord
  belongs_to :matriculation
  validates_presence_of :total, :expire_at, :matriculation_id, :status
  validates :status, acceptance: { accept: ["Aberta", "Atrasada", "Paga"] }
end
