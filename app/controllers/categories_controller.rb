class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    respond_to do |format|
      if @category.save
        format.html {redirect_to(category_params)}
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 
    def category_params
      params.require(:category).permit(:name, :picture_marker)
    end
end
