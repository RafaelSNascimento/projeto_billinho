class Api::MatriculationsController < ApplicationController
  before_action :set_student, unless: -> { params[:student_id].blank? }
  before_action :set_institution, unless: -> { params[:institution_id].blank? }
  before_action :set_matriculation, only: [:show, :update, :destroy]

  #GET /institutions/:institution_id/matriculations
  #GET /student/:student_id/matriculations
  #GET /matriculations
  def index
    if (@student.nil? == false)
      json_response(@student.matriculations)
    elsif (@institution.nil? == false)
      json_response(@institution.matriculations)
    else
      json_response(Matriculation.all)
    end
  end

  # POST /matriculations
  def create
    matriculation = Matriculation.create!(matriculation_params)
    # verify if matriculation has created with success
    if (matriculation.id)
      # get invoices expire day
      invoiceExpire = matriculation.invoice_expire_at
      # get current date and set day to the invoice expire day
      calcInvoiceDate = DateTime.now.change(day: invoiceExpire)
      # verify if the invoice expire day was less than the current day
      if (DateTime.now.day >= invoiceExpire)
        # if is, add one month to the calcInvoiceDate
        calcInvoiceDate = calcInvoiceDate + 1.month
      end
      # calc the invoices total
      invoiceTotal = matriculation.total / matriculation.invoice
      # add the first invoice
      invoices = [{ total: invoiceTotal, matriculation_id: matriculation.id, status: "Aberta", expire_at: calcInvoiceDate }]
      # start looping to add the others invoices
      for i in 2..matriculation.invoice
        # add one month for each looping
        calcInvoiceDate = calcInvoiceDate + 1.months
        invoices.push({ total: invoiceTotal, matriculation_id: matriculation.id, status: "Aberta", expire_at: calcInvoiceDate })
      end
      # create the invoices in database and add the callback value to matriculation.invoices
      matriculation = matriculation.attributes.merge({ :invoiceList => Invoice.create!(invoices) })
    end
    json_response(matriculation, :created)
  end

  # GET /matriculations/:id
  def show
    json_response(@matriculation)
  end

  # DELETE /matriculations/:id
  def destroy
    @matriculation.destroy
    head :no_content
  end

  private

  def matriculation_params
    params.permit(:total, :invoice, :invoice_expire_at, :course_name, :student_id, :institution_id)
  end

  def set_institution
    @institution = Institution.find(params[:institution_id])
  end

  def set_student
    @student = Student.find(params[:student_id])
  end

  def set_matriculation
    @matriculation = Matriculation.find(params[:id])
  end
end
