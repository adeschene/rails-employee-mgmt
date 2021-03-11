class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]

  def index
    @companies = Company.all.order("created_at")
  end

  def show
  end

  def edit
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to companies_url, notice: "Company was successfully created."
    else
      redirect_to companies_url, alert: "Company creation failed..."
    end
  end

  def update
    if @company.update(company_params)
      redirect_to @company, notice: "Company was successfully updated."
    else
      render :edit, alert: "Company update failed..."
    end
  end

  def destroy
    @company.destroy

    redirect_to companies_url, notice: "Company was successfully deleted."
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name)
    end
end
