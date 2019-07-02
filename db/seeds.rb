# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_books(num)
  num = 1 if num < 1

  num.times.reduce([]) do |res, idx|
    res << Book.create!(
      name: "book name #{idx}",
      author: "author #{idx / 5}",
      price: 100.1
    )
  end
end

def create_comments(book, num)
  num = 1 if num < 1

  num.times do |idx|
    book.comments.create!(
      user: "user #{rand 100}",
      content: "comment [#{book.name}], [#{idx}]"
    )
  end
end

# Comment.destroy_all
# Book.destroy_all
# books = create_books(100)
# books.each do |book|
#   create_comments(book, rand(10))
# end

def create_users(num)
  num = 1 if num < 1
  num.times do |idx|
    User.create!(
      name: "name #{idx}",
      gender: (rand(2).odd? ? 'm' : 'f'),
      birthday: Date.today - 365*18 - rand(1000)
    )
  end
end

create_users(10)
