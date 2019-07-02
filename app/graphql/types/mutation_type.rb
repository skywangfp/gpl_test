module Types
  class MutationType < Types::BaseObject
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

    field :bookDestroy, String, null: false do
      description 'destroy book'
      argument :id, ID, required: true
    end
    def book_destroy(id:)
      book = Book.find_by_id(id)

      if book
        book.destroy
        'Success!'
      else
        "book[#{id}] is not found"
      end
    end
  end
end
