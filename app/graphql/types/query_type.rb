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
  end
end
