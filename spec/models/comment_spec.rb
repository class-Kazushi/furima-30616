require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe '商品へのコメント機能' do
    context '商品へのコメントができる場合' do
      it 'textがある場合に商品へのコメントができる' do
        expect(@comment).to be_valid
      end
    end
    context '商品へのコメントができない場合' do
      it 'ユーザーが紐づいていないと商品へのコメントはできない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
      it 'ユーザーが紐づいていないと商品へのコメントはできない' do
        @comment.product = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Product must exist')
      end
      it 'textが空では商品へのコメントはできない' do
        @comment.text = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end