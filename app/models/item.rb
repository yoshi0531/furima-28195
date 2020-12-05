class Item < ApplicationRecord
  belongs_to :user
  has_one    :orders
  has_many   :comments
  has_one_attached :image

  validates :image, presence: true, unless: :was_attached?
  
  def was_attached?
    self.image.attached?
  end

  with_options presence: true do
    validates :name
    validates :text
    validates :price
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