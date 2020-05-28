class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end
  def show
    @item = Company.find(params[:id])
  end
end
