require "rails_helper"

RSpec.describe "Institutions API", type: :request do
  let!(:institutions) { create_list(:institution, 10) }
  let(:institution_id) { institutions.first.id }

  describe "GET /api/institutions" do
    before { get "/api/institutions" }
    it "returns institutions" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/institutions/:id" do
    before { get "/api/institutions/#{institution_id}" }
    context "when the record exists" do
      it "returns the institution" do
        expect(json).not_to be_empty
        expect(json["id"]).to eq(institution_id)
      end
      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end
    context "when the record does not exist" do
      let(:institution_id) { 100 }
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Institution with 'id'=100/)
      end
    end
  end

  describe "POST /api/institutions" do
    let(:valid_attributes) { { name: "Unitau", cnpj: "20694290000128", is_type: "Universidade" } }

    context "when the request is valid" do
      before { post "/api/institutions", params: valid_attributes, as: :json }

      it "creates a institution" do
        expect(json["name"]).to eq("Unitau")
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is invalid" do
      before { post "/api/institutions", params: { cnpj: "Foobar" } }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end

      it "returns a validation failure message" do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe "PUT /api/institutions/:id" do
    let(:valid_attributes) { { name: "Anhanguera" } }
    context "When the record exists" do
      before { put "/api/institutions/#{institution_id}", params: valid_attributes, as: :json }

      it "updates the record" do
        expect(response.body).to be_empty
      end
      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe "DELETE /api/institutions/:id" do
    before { delete "/api/institutions/#{institution_id}" }
    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end
