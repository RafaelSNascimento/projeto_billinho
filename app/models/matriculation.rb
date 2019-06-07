class Matriculation < ApplicationRecord
  belongs_to :institution
  belongs_to :student
  validates_presence_of :total, :invoice, :invoice_expire_at, :course_name, :institution_id, :student_id
end
