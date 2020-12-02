class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  has_many :comments

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Include both letters and numbers"}
    
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "is invalid. Input full-width characters."} do
      validates :first_name
      validates :last_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."} do
      validates :first_name_reading
      validates :last_name_reading
    end
  end
end