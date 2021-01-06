class ItemsTag

  include ActiveModel::Model
  attr_accessor :name

  with_options presence: true do
    validates :name
  end

  def save
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

end