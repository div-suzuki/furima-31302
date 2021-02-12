require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品' do
    context '新規出品がうまくいくとき' do
      it '全ての情報を入力すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規出品がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'infoが空だと登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'category_idが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'sales_status_idが1だと登録できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status must be other than 1")
      end
      it 'shipping_fee_status_idが1だと登録できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1")
      end
      it 'prefecture_idが1だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'scheduled_delivery_idが1だと登録できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
      end
      it 'priceが300円より安いと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end
      it 'priceが9999999円より高いと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
      it 'priceが全角数字だと登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
