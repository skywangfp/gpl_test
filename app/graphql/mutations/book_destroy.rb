class Mutations::BookDestroy < Mutations::Base
  # description 'destroy book'
  argument :id, ID, required: true

  field :res_code, Integer, null: false
  field :res_msg, String, null: true
  # field :book, Types::BookType, null: true

  def resolve(id:)
    # byebug
    book = Book.find_by_id(id)
    # book = context.schema.object_from_id(id, context)

    if book
      book.destroy!
      {
        res_code: 0,
        res_msg: 'Success!'
      }
    else
      {
        res_code: -1,
        res_msg: "book[#{id}] is not found"
      }
    end
  end
end
