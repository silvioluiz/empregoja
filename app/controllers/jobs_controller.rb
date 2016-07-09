class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @companies = Company.all
  end

  def create
    @job = Job.new(job_parameters)
    if @job.invalid?
      flash[:notice] = "Não foi possível criar a vaga"
      @companies = Company.all
      render :new
    elsif
      @job = Job.create(job_parameters)
      redirect_to @job
    end
  end

  private
  def job_parameters
    params.require(:job)
      .permit(:title, :location, :category, :description, :featured, :company_id)

  end

end
