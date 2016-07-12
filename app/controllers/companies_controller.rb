class CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
    @jobs = @company.jobs.all
    if @company.jobs.empty?
      flash[:notice] = "Nenhuma vaga disponível"
    end
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
