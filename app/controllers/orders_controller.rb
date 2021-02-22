class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index] 

  def index
    @item_transaction_address = ItemTransactionAddress.new
  end

  def create
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
    params.require(:item_transaction_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: transaction_params[:token],    # カードトークン
      currency: 'jpy'          # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if @item.item_transaction.present? || current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end