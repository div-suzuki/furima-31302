class Address < ApplicationRecord
  belongs_to :item_transaction

  belongs_to :prefecture
end
