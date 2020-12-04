class Item < ApplicationRecord
  belongs_to :user
  has_one    :orders
  has_many   :comments
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :prefecture_id
    validates :days_id
    validates :price

    with_options :image, unless: :was_attached? do
      def was_attached?
        self.image.attached?
      end
    end
  end
end