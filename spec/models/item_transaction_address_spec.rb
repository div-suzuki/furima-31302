require 'rails_helper'

RSpec.describe ItemTransactionAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_transaction_address = FactoryBot.build(:item_transaction_address, user_id: user.id, item_id: item.id)
    sleep 0.1 
  end

  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@item_transaction_address).to be_valid
  end
  it 'postal_codeが空だと保存できないこと' do
    @item_transaction_address.postal_code = ''
      @item_transaction_address.valid?
      expect(@item_transaction_address.errors.full_messages).to include("Postal code can't be blank")
  end
  it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    @item_transaction_address.postal_code = '1234567'
    @item_transaction_address.valid?
    expect(@item_transaction_address.errors.full_messages).to include('Postal code is invalid')
  end
  it 'prefecture_idが1だと保存できないこと' do
    @item_transaction_address.postal_code = ''
      @item_transaction_address.valid?
      expect(@item_transaction_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
  end
  it 'cityが空だと保存できないこと' do
    @item_transaction_address.city = ''
      @item_transaction_address.valid?
      expect(@item_transaction_address.errors.full_messages).to include("City can't be blank")
  end
  it 'addressが空だと保存できないこと' do
    @item_transaction_address.address = ''
      @item_transaction_address.valid?
      expect(@item_transaction_address.errors.full_messages).to include("Address can't be blank")
  end
  it 'buildingは空でも保存できること' do
    @item_transaction_address.building = ''
      expect(@item_transaction_address).to be_valid
  end
  it 'phone_numberが空だと保存できないこと' do
    @item_transaction_address.phone_number = ''
      @item_transaction_address.valid?
      expect(@item_transaction_address.errors.full_messages).to include("Phone number can't be blank")
  end
  it 'phone_numberが数値でないと保存できない' do
    @item_transaction_address.phone_number = 'あああ'
      @item_transaction_address.valid?
      expect(@item_transaction_address.errors.full_messages).to include("Phone number is not a number")
  end
  it 'phone_numberはハイフンがあると保存できないこと' do
    @item_transaction_address.phone_number = '090-1234-5678'
      @item_transaction_address.valid?
      expect(@item_transaction_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
  end
  it 'phone_numberは11文字以上だと保存できないこと' do
    @item_transaction_address.phone_number = '0901234567890'
      @item_transaction_address.valid?
      expect(@item_transaction_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
  end
end
