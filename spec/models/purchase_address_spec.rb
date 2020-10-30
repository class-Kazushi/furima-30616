require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入機能' do
    context '商品の購入ができる時' do
      it 'すべての項目が入力されている場合に保存できる' do
        expect(@purchase_address).to be_valid
      end
      it '建物名のみ空の場合は保存できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end
    context '商品の購入ができない時' do
      it 'tokenがない場合は保存できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空の場合は保存できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
      end
      it '郵便番号にハイフン(-)がない場合は保存できない' do
        @purchase_address.postal_code = '0000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県が正しく選択されていない場合は保存できない' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it '市区町村が空の場合は保存できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空の場合は保存できない' do
        @purchase_address.address_num = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address num can't be blank")
      end
      it '電話番号が空の場合は保存できない' do
        @purchase_address.phone_num = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone num can't be blank", 'Phone num is invalid')
      end
      it '電話番号が12桁以上の場合は保存できない' do
        @purchase_address.phone_num = '000011111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone num is invalid')
      end
    end
  end
end
