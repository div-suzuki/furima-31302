class ItemTransactionAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_transaction_id

  with_options presence: true do
    validates :item_id, :user_id, :item_transaction_id
    validates :prefecture_id, numericality: {other_than: 1}
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :phone_number, numericality: {only_integer: true}, length: { maximum: 11 }
    validates :city, :address
  end

  def save
    item_transaction = ItemTransaction.create(item_id: item_id, user_id: user_id)    
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, building: building, phone_number: phone_number, item_transaction_id: item_transaction.id)
  end
end