
def find_book(id = 201)
  query_string = "
  {
    book(id: #{id}) {
      id
      name
      author
      comments {
        id
        user
        content
      }
    }
  }"
  result_hash = GplTestSchema.execute(query_string)
end

def find_book_1(id = 201)
  query_string = "
  mutation{
    book(id: #{id}) {
  id
  name,author
    }
  }"
  result_hash = Schema.execute(query_string)
end

query_string = "
mutation{
  book1
}"

def create_book
  query_string = "
  mutation{
    book(name: \"aaa\", author: \"ddd\", price: 123.45) {
      id
      name
      author
      price
    }
  }"
  result_hash = GplTestSchema.execute(query_string)
end

result_hash = GplTestSchema.execute "mutation{booo(name: \"aaa\",author:\"aaa\",price:123.45)\n{\nid\nname,author,price}}"

def update_book(id, name, author, price)
  query_string = "
  mutation{
    bookUpdate(id: #{id}, name: \"#{name}\", author: \"#{author}\", price: #{price}) {
      id
      name
      author
      price
    }
  }
  "
  result_hash = GplTestSchema.execute(query_string)
end

update_book(201, "book 201", 'author 201', 1234.56)

def destroy_book(id)
  query_string = "
    mutation {
      bookDestroy(id: #{id})
    }
  "
  result_hash = GplTestSchema.execute(query_string)
end
destroy_book(1)
destroy_book(201)
destroy_book(202)
