class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    if @category.jobs.empty?
      flash.now[:error] = "Nenhuma vaga disponível"
    end
  end
end
