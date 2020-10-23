require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context "商品の出品ができる場合" do
      it "name, details, category_id, condition_id, delivery_charge_id, region_id, period_id, priceが入力されていれば出品できる" do
        expect(@product).to be_valid
      end
    end
    context "商品の出品ができない場合" do
      it "ユーザーが紐づいていないと商品は出品できない" do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("User must exist")
      end
      it "商品の画像がない場合は出品できない" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がない場合は出品できない" do
        @product.name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it "商品説明がない場合は出品できない" do
        @product.details = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Details can't be blank")
      end
      it "商品カテゴリーが選択されていない場合は出品できない" do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態が選択されていない場合は出品できない" do
        @product.condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition must be other than 1")
      end
      it "配送料の負担が選択されていない場合は出品できない" do
        @product.delivery_charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery charge must be other than 1")
      end
      it "発送元の地域が選択されていない場合は出品できない" do
        @product.region_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Region must be other than 0")
      end
      it "発送までの日数が選択されていない場合は出品できない" do
        @product.period_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Period must be other than 1")
      end
      it "販売価格が入力されていない場合は出品できない" do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank", "Price is not a number")
      end
      it "販売価格が300円以上でない場合は出品できない" do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "販売価格が9,999,999円以下でない場合は出品できない" do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "販売価格に数字以外が入力されている場合は出品できない" do
        @product.price = "あア阿a"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
