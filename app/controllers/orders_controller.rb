class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_transaction_address = ItemTransactionAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @item_transaction_address = ItemTransactionAddress.new(transaction_params)
    if @item_transaction_address.valid?
      pay_item
      @item_transaction_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def transaction_params
    params.require(:item_transaction_address).permit(:token,:postal_code,:prefecture_id,:city,:address,:building,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end