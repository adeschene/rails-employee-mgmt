class EmployeesController < ApplicationController
  before_action :set_company

  def create
    @employee = @company.employees.build(employee_params)

    if @employee.save
      redirect_to company_path(@company), notice: "Employee was successfully created."
    else
      redirect_to company_path(@company), alert: "Employee creation failed..."
    end
  end

  def destroy
    @employee = @company.employees.find(params[:id])
    @employee.destroy

    redirect_to company_path(@company), notice: "Employee was successfully destroyed."
  end

  private
    def set_company
      @company = Company.find(params[:company_id])
    end

    def employee_params
      params.require(:employee).permit(:email, :role)
    end
end
