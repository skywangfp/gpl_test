module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World!"
    # end

    field :book, BookType, null: true do
      description "Find a book by ID"
      argument :id, ID, required: true
    end

    # Then provide an implementation:
    def book(id:)
      Book.find(id)
    end

    field :books, [BookType], null: false do
      description "search books"
      argument :name, String, required: false
      argument :author, String, required: false
      argument :priceStart, Integer, required: false
      argument :priceEnd, Float, required: false
      argument :pageSize, Integer, required: false
      argument :pageNo, Integer, required: false
      argument :bookId, ID, required: false
    end

    def books(name: nil, author: nil, price_start: nil, price_end: nil, page_size: 15, page_no: 0, book_id: nil)
      Book.filter_name(name)
        .filter_author(author)
        .filter_price_start(price_start)
        .filter_price_end(price_end)
        .filter_page(page_size, page_no)
    end

    field :user, UserType, null: false do
      description 'find user by id'
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    field :users, [UserType], null: true do
      description 'show users'
      argument :first, Integer, required: false
    end

    def users(first:)
      users = User.all
      users = users.limit(first) if first.present?
      users
    end

    field :bookList, BookType, null: true do
      description 'book list'
    end
    def book_list
      User.all
    end
  end
end
