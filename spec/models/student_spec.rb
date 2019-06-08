require "rails_helper"

RSpec.describe Student, type: :model do
  # association test
  it { should have_many(:matriculations).dependent(:destroy) }

  # validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:cpf) }
  it { should validate_presence_of(:gender) }
  it { should validate_presence_of(:payment_type) }
end
