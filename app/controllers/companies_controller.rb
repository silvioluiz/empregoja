class CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_parameters)
    if @company.valid?
      @company.save
      redirect_to @company
    else

    end

  end

  private
  def company_parameters
    params.require(:company).permit(:name, :location, :mail, :phone)
  end

end
