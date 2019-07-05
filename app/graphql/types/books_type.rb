module Types
  BooksType = GraphQL::Field.define do
    name('books1')
    # argument :filter, types.String, default_value: nil
    # argument :tag, types.String, default_value: nil
    # argument :order, types.String, default_value: '-id'
    type(BookType.connection_type)

    description 'Book connection to fetch paginated books collection.'

    # Custom resolver
    resolve(BookResolver.new)
  end
end
