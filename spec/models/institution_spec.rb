require "rails_helper"

RSpec.describe Institution, type: :model do
  # association test
  it { should have_many(:matriculations).dependent(:destroy) }

  # validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:cnpj) }
end
