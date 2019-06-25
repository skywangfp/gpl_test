json.extract! book, :id, :name, :author, :price, :picture, :created_at, :updated_at
json.url book_url(book, format: :json)
