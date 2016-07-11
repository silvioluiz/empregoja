class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job= Job.find(params[:id])
    @companies = Company.all
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_parameters)
      redirect_to @job
    else
      flash[:notice] = "Não foi possível atualizar a vaga"
      @companies = Company.all
      render :edit
    end
  end

  def new
    @job = Job.new
    @companies = Company.all
  end

  def create
    @job = Job.new(job_parameters)
    if @job.save
      @job = Job.create(job_parameters)
      redirect_to @job
    elsif
      flash[:notice] = "Não foi possível criar a vaga"
      @companies = Company.all
      render :new
    end
  end

  private
  def job_parameters
    params.require(:job)
      .permit(:title, :location, :category, :description, :featured, :company_id)

  end

end
