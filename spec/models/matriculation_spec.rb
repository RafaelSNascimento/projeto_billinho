require "rails_helper"

RSpec.describe Matriculation, type: :model do
  # association test
  it { should belong_to(:institution) }
  it { should belong_to(:student) }
  it { should have_many(:invoices).dependent(:destroy) }

  # validation tests
  it { should validate_presence_of(:total) }
  it { should validate_presence_of(:invoice) }
  it { should validate_presence_of(:invoice_expire_at) }
  it { should validate_presence_of(:course_name) }
  it { should validate_presence_of(:student_id) }
  it { should validate_presence_of(:institution_id) }
end
