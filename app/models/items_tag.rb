class ItemsTag

  include ActiveModel::Model
  attr_accessor :name, :text, :category_id, :status_id, :cost_id, :prefecture_id, :day_id, :price, :image, :user_id, :item_id, :tag_name

  with_options presence: true do
    validates :name
    validates :text
    validates :price, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width number characters."}, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :prefecture_id
    validates :day_id
  end

  def save
    item = Item.create(name: name, text: text, category_id: category_id, status_id: status_id, cost_id: cost_id, prefecture_id: prefecture_id, day_id: day_id, price: price, image: image, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

end