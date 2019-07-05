module Types
  class BookList < Types::BaseObject
    description 'book list'

    field :books, Types::BookType.connection_type, null: true
  end
end
