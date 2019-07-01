class Types::BookType < Types::BaseObject
  description "A Book"

  field :id, ID, null: false
  field :name, String, null: false
  field :author, String, null: false
  field :price, Float, null: false
  field :created_at, String, null: false
  field :updated_at, String, null: false
  field :comments, [Types::CommentType], null: true do
    description 'comments'
    argument :pageSize, Integer, required: false
    argument :pageNo, Integer, required: false
  end

  def comments(page_size: nil, page_no: nil)
    object.comments.filter_page(page_size, page_no)
  end
end
