class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[\w-]{8,128}+\z/i }

  with_options presence: true do
    validates :nickname, :birth_date
  
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
      validates :first_name, :last_name
    end
  
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :first_name_kana, :last_name_kana
    end
  end
end