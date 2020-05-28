class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end
  def show
    @item = Company.find(params[:id])
  end
  def new
    @company = Company.new
  end
  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end
  
  private
  
  def company_params
    params.require(:company).permit(:name, :description, :start_date, :country)
  end
end
