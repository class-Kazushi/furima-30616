class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_record_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_record_params
    params.permit(:product_id, :postal_code, :prefecture_id, :city, :address_num, :building_name, :phone_num).merge(user_id: current_user.id, purchase_record_id: params[:purchase_record_id])
  end

end