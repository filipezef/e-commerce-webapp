class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :require_admin

  def show
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category created successfully'
      redirect_to @category
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = 'Category updated successfully'
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = 'Category was deleted successfully'
    redirect_to categories_path
  end

  private

  def set_category
    if !Category.find_by(id: params[:id]).nil?
      @category = Category.find(params[:id])
    else
      flash[:alert] = 'Category id not found'
      redirect_to categories_path
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end
end