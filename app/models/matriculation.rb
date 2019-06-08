class Matriculation < ApplicationRecord
  belongs_to :institution
  belongs_to :student
  has_many :invoices, dependent: :destroy
  validates_presence_of :total, :invoice, :invoice_expire_at, :course_name, :institution_id, :student_id
  validates :total, numericality: { greater_than: 0 }
  validates :invoice, numericality: { greater_than_or_equal_to: 1, only_integer: true }
  validates :invoice_expire_at, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 31, only_integer: true }
end
