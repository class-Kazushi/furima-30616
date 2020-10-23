class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :details, :category_id, :condition_id, :delivery_charge_id, :region_id, :period_id, :price, :image).merge(user_id: current_user.id)
  end

end