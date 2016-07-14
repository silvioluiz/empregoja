class CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
    @jobs = @company.jobs.all
    if @company.jobs.empty?
      flash.now[:error] = "Nenhuma vaga disponível"
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
      flash.now[:error] = "Não foi possível criar a Empresa"
      render 'new'
    end

  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(company_parameters)
      redirect_to @company
    else
      flash.now[:error] = "Não foi possível atualizar a Empresa"
      render 'edit'
    end

  end

  private
  def company_parameters
    params.require(:company).permit(:name, :location, :mail, :phone)
  end

end
