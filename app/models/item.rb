class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name, :info, :image

    with_options format: {with: /\A[0-9]+\z/ },
    length: {minimum: 3, maxinum: 7}, numericality: { only_integer: true, greater_than: 299, less_than: 9999999 } do
      validates :price
    end
  end

  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :sales_status_id
  validates :shipping_fee_status_id
  validates :prefecture_id
  validates :scheduled_delivery_id
  end
end

