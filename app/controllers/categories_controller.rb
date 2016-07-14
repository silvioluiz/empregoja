class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    if @category.jobs.empty?
      flash.now[:error] = "Nenhuma vaga disponível"
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit(:name))

    if @category.valid?
      @category.save
      redirect_to @category
    elsif
      flash.now[:error] = 'Não foi possível criar a categoria'
      render :new
    end

  end

end
