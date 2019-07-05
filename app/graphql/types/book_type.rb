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
    argument :bookId, ID, required: false
    argument :pageSize, Integer, required: false
    argument :pageNo, Integer, required: false
  end
  field :comments_count, Integer, null: false do
    description 'comments count'
  end

  def comments(book_id: nil, page_size: nil, page_no: nil)
    return [] unless object.id.eql?(book_id.to_i)
    object.comments.filter_page(page_size, page_no).order(id: :desc)
  end

  def comments_count
    object.comments.count
  end
end
