require "rails_helper"

RSpec.describe "Matriculations API" do
  let!(:student) { create(:student) }
  let!(:institution) { create(:institution) }
  let!(:matriculations) { create_list(:matriculation, 10, student_id: student.id, institution_id: institution.id) }
  let(:student_id) { student.id }
  let(:institution_id) { institution.id }
  let(:matriculation_id) { matriculations.first.id }

  describe "GET /api/institutions/:institution_id/matriculations" do
    before { get "/api/institutions/#{institution_id}/matriculations" }
    context "When institution exists" do
      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end

      it "returns all institution matriculations" do
        expect(json.size).to eq(10)
      end
    end

    context "When institution does not exist" do
      let(:institution_id) { 0 }
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Institution with 'id'=0/)
      end
    end
  end

  describe "GET /api/students/:student_id/matriculations" do
    before { get "/api/students/#{student_id}/matriculations" }
    context "When student exists" do
      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end

      it "returns all student matriculations" do
        expect(json.size).to eq(10)
      end
    end

    context "When student does not exist" do
      let(:student_id) { 0 }
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Student with 'id'=0/)
      end
    end
  end

  describe "GET /api/matriculations" do
    before { get "/api/matriculations" }
    it "returns matriculations" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /api/matriculations" do
    let(:valid_attributes) { { total: 100, invoice: 10, invoice_expire_at: 5, course_name: "Análise e Desenvolvimento de Sistemas", institution_id: institution_id, student_id: student_id } }
    let(:invalid_attributes) { { total: -1, invoice: 10, invoice_expire_at: 5, course_name: "Análise e Desenvolvimento de Sistemas", institution_id: institution_id, student_id: student_id } }

    context "when the request is valid" do
      before { post "/api/matriculations", params: valid_attributes, as: :json }

      it "creates a matriculation" do
        expect(json["course_name"]).to eq("Análise e Desenvolvimento de Sistemas")
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is invalid" do
      before { post "/api/matriculations", params: invalid_attributes, as: :json }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end

      it "returns a validation failure message" do
        expect(response.body).to match(/Validation failed: Total must be greater than 0/)
      end
    end
  end

  describe "GET /api/matriculations/id" do
    before { get "/api/matriculations/#{matriculation_id}" }
    context "when the record exists" do
      it "returns the matriculation" do
        expect(json).not_to be_empty
        expect(json["id"]).to eq(matriculation_id)
      end
      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:matriculation_id) { 100 }
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Matriculation with 'id'=100/)
      end
    end
  end

  describe "DELETE /api/matriculations/:id" do
    before { delete "/api/matriculations/#{matriculation_id}" }
    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end
