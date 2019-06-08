require "rails_helper"

RSpec.describe "Invoices API" do
  let!(:student) { create(:student) }
  let!(:institution) { create(:institution) }
  let(:student_id) { student.id }
  let(:institution_id) { institution.id }
  describe "POST /api/matriculations" do
    let(:valid_attributes) { { total: 100, invoice: 10, invoice_expire_at: 5, course_name: "Análise e Desenvolvimento de Sistemas", institution_id: institution_id, student_id: student_id } }

    context "when the request is valid" do
      before { post "/api/matriculations", params: valid_attributes, as: :json }

      it "creates a matriculation" do
        expect(json["invoiceList"].length).to eq(10)
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end
  end
end
