class Item < ApplicationRecord
  belongs_to :user
  has_one    :order
  has_many   :messages
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :price, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width number characters."}, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
    validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :day

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :prefecture_id
    validates :day_id
  end
end