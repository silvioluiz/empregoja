class JobsController < ApplicationController
  before_action :set_collections, only: [:new, :edit]
  before_action :find_job, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    find_job
    if @job.update(job_parameters)
      redirect_to @job
    else
      flash[:notice] = "Não foi possível atualizar a vaga"
      set_collections
      render :edit
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_parameters)
    if @job.save
      @job = Job.create(job_parameters)
      redirect_to @job
    elsif
      flash[:notice] = "Não foi possível criar a vaga"
      set_collections
      render :new
    end
  end

  private

  def find_job
    @job = Job.find(params[:id])
  end

  def set_collections
    @companies = Company.all
    @categories = Category.all
  end

  def job_parameters
    params.require(:job)
      .permit(:title, :location, :category_id,
              :description, :featured, :company_id)

  end

end
