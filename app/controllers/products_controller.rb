class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :sold_out_block, only: [:edit, :update, :destroy]

  def index
    @products = Product.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @comment = Comment.new
    @comments = @product.comments.includes(:user)
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :details, :category_id, :condition_id, :delivery_charge_id, :region_id, :period_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @product = Product.find(params[:id])
    unless current_user == @product.user
      redirect_to action: :index 
    end
  end

  def sold_out_block
    if @product.purchase_record.present?
      redirect_to root_path
    end
  end
end
