require "rails_helper"

RSpec.describe "Students API", type: :request do
  let!(:students) { create_list(:student, 10) }
  let(:student_id) { students.first.id }

  describe "GET /api/students" do
    before { get "/api/students" }
    it "returns students" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/students/:id" do
    before { get "/api/students/#{student_id}" }
    context "when the record exists" do
      it "returns the student" do
        expect(json).not_to be_empty
        expect(json["id"]).to eq(student_id)
      end
      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end
    context "when the record does not exist" do
      let(:student_id) { 100 }
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Student with 'id'=100/)
      end
    end
  end

  describe "POST /api/students" do
    let(:valid_attributes) { { name: "Rafael dos Santos Nascimento", cpf: "43816751857", dt_birth: DateTime.now, telephone: 123, gender: "M", payment_type: "Boleto" } }

    context "when the request is valid" do
      before { post "/api/students", params: valid_attributes, as: :json }

      it "creates a student" do
        expect(json["name"]).to eq("Rafael dos Santos Nascimento")
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is invalid" do
      before { post "/api/students", params: { dt_birth: "Foobar" } }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end

      it "returns a validation failure message" do
        expect(response.body).to match(/Validation failed: Name can't be blank, Cpf can't be blank, Gender can't be blank, Payment type can't be blank/)
      end
    end
  end

  describe "PUT /api/students/:id" do
    let(:valid_attributes) { { name: "Rafael Nascimento" } }
    context "When the record exists" do
      before { put "/api/students/#{student_id}", params: valid_attributes, as: :json }

      it "updates the record" do
        expect(response.body).to be_empty
      end
      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe "DELETE /api/students/:id" do
    before { delete "/api/students/#{student_id}" }
    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end
