class Api::StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update, :destroy]

  #GET /students
  def index
    @students = Student.all
    json_response(@students)
  end

  # POST /students
  def create
    @student = Student.create!(student_params)
    json_response(@student, :created)
  end

  # GET /students/:id
  def show
    json_response(@student)
  end

  # DELETE /students/:id
  def destroy
      @student.destroy
      head :no_content
  end

  # UPDATE /students/:id
  def update
      @student.update(student_params)
      head :no_content
  end

  private

  def student_params
    params.permit(:name, :cpf, :dt_birth, :gender, :payment_type, :telephone)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
