class Admin::CategoriesController < Admin::AdministratorsController
  before_action :authenticate_admin!
  before_action :get_category, only: [:edit, :update, :destroy]
  def index
    @categories = Category.all.page(params[:page]).per(15)
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
    if @category.update(category_params)
      redirect_to admin_categories_path
    end
  end

  def destroy
  end

  private 

    def get_category
      @category = Category.find_by id: params[:id]
    end
    def category_params
      params.require(:category).permit(:name, :marker)
    end
end
