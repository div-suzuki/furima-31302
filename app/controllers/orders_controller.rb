class OrdersController < ApplicationController
  def index
    @item_transaction_address = ItemTransactionAddress.new
  end

  def create
    @item_transaction_address = ItemTransactionAddress.new(transaction_params)
    if @item_transaction_address.valid?
      @item_transaction_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def transaction_params
    params.require(:item_transaction_address).permit(:token,:postal_code,:prefecture_id,:city,:address,:building,:phone_number)
  end
end
