module Types
  class MutationType < Types::BaseObject
    # field :bookDestroy, mutation
    field :book_destroy, mutation: Mutations::BookDestroy

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

    field :book1, String, null: false
    def book1
      'hello world'
    end

    field :bookCreate, BookType, null: false do
      description "Create a book by ID"
      argument :name, String, required: true
      argument :author, String, required: true
      argument :price, Float, required: true
    end
    def book_create(name:, author:, price:)
      Book.create!(
        name: name,
        author: author,
        price: price
      )
    end

    field :bookUpdate, BookType, null: false do
      description 'update book info'
      argument :id, ID, required: true
      argument :name, String, required: false
      argument :author, String, required: false
      argument :price, Float, required: false
    end
    def book_update(id:, name:, author:, price:)
      book = Book.find id
      book.name = name if name.present?
      book.author = author if author.present?
      book.price = price if price.present?
      book.save!
      book
    end

    field :commentDestroy, String, null: false do
      description 'destroy comment'
      argument :id, ID, required: true
    end
    def comment_destroy(id:)
      comment = Comment.find_by_id(id)
      if comment
        comment.destroy
        return 'Success!'
      else
        "comment[#{id}] is not found"
      end
    end

    field :commentCreate, CommentType, null: false do
      description 'create a comment'
      argument :bookId, ID, required: true
      argument :user, String, required: true
      argument :content, String, required: true
    end
    def comment_create(book_id:, user:, content:)
      Comment.create!(
        book_id: book_id,
        user: user,
        content: content
      )
    end
  end
end
