class Api::InstitutionsController < ApplicationController
  before_action :set_institution, only: [:show, :update, :destroy]

  #GET /institutions
  def index
    @institutions = Institution.all
    json_response(@institutions)
  end

  #POST /institutions
  def create
    @institution = Institution.create!(institution_params)
    json_response(@institution, :created)
  end

  #GET /institutions/:id
  def show
    json_response(@institution)
  end

  #DELETE /institutions/:id
  def destroy
    @institution.destroy
    head :no_content
  end

  # UPDATE /institutions/:id
  def update
    @institution.update(institution_params)
    head :no_content
  end

  private

  def institution_params
    params.permit(:name, :cnpj, :is_type)
  end

  def set_institution
    @institution = Institution.find(params[:id])
  end
end
