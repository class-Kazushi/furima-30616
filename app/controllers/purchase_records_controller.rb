class PurchaseRecordsController < ApplicationController
  before_action :move_to_top
  before_action :sold_out_block

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_record_params)
    if @purchase_address.valid?
      pay_product
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_record_params
    params.permit(:product_id, :postal_code, :prefecture_id, :city, :address_num, :building_name, :phone_num, :token).merge(user_id: current_user.id)
  end

  def pay_product
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Product.find(params[:product_id]).price,
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_top
    @product = Product.find(params[:product_id])
    unless current_user != @product.user && user_signed_in?
      redirect_to root_path 
    end
  end

  def sold_out_block
    if @product.purchase_record.present?
      redirect_to root_path 
    end
  end
end
