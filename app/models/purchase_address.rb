class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_code, :prefecture_id, :city, :address_num, :building_name, :phone_num, :purchase_record_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city, :address_num
    validates :phone_num, format: { with: /\A\d{10}$|^\d{11}\z/ }
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_num: address_num, building_name: building_name, phone_num: phone_num, purchase_record_id: purchase_record.id)
  end

end