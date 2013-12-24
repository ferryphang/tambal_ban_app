class CategoryController < ApplicationController
  before_action :set_category, only: [:edit, :destroy]  

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
       format.html { redirect_to(categorys_path) }
      end
    end
  end

  def edit
  end

  def update
    @category = Category.update_attributes(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to(category_path) }
      end
    end
  end

  def destroy
    Category.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to(category_path) }
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :picture_marker)
    end
end
