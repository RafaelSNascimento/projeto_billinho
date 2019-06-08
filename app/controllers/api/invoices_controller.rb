class Api::InvoicesController < ApplicationController
  before_action :set_matriculation, unless: -> { params[:matriculation_id].blank? }
  before_action :set_invoice, only: [:show, :update]

  #GET /invoices/:invoice
  #GET /matriculations/:matriculation_id/invoices
  def index
    if (@matriculation.nil? == false)
      json_response(@matriculation.invoices)
    else
      json_response(Invoice.all)
    end
  end

  # UPDATE /invoices/:id
  def update
    @invoice.update(invoice_params)
    if (@invoice.errors.size === 0)
      head :no_content
    else
      json_response(@invoice.errors, 422)
    end
  end

  private

  def invoice_params
    params.permit(:status)
  end

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def set_matriculation
    @matriculation = Matriculation.find(params[:matriculation_id])
  end
end
