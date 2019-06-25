
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

# result_hash = GplTestSchema.execute "mutation{booo(name: \"aaa\",author:\"aaa\",price:123.45)\n{\nid\nname,author,price}}"

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

# update_book(201, "book 201", 'author 201', 1234.56)

def destroy_book(id)
  query_string = "
    mutation {
      bookDestroy(id: #{id})
    }
  "
  result_hash = GplTestSchema.execute(query_string)
end
# destroy_book(1)
# destroy_book(201)
# destroy_book(202)

# search
def search_books(name = nil, author = nil, price_start = nil, price_end = nil, page_size = nil, page_no = nil)
  query_string = <<QUERY_STRING
    {
      books(name: \"#{name}\", author: \"#{author}\"#{', priceStart: ' + price_start.to_s if price_start}#{', priceEed: ' + price_end.to_s if price_end}#{', pageSize: ' + page_size.to_s if page_size}#{', pageNo: ' + page_no.to_s if page_no}) {
        id
        name
        author
        price
      }
    }
QUERY_STRING
puts query_string.inspect
      # books(name: \"\", author: \"\", priceStart: , priceEnd: 33)
# byebug
  result_hash = GplTestSchema.execute(query_string)
  puts result_hash.inspect
end
byebug
search_books(nil, nil, nil, nil, 3, 0)
