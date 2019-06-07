require 'rails_helper'

RSpec.describe Invoice, type: :model do
  # association test
  it { should belong_to(:matriculation) }
  
  # validation tests
  it { should validate_presence_of(:total) }
  it { should validate_presence_of(:expire_at) }
  it { should validate_presence_of(:matriculation_id) }
  it { should validate_presence_of(:status) }
end
