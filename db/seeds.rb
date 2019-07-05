Faker::Config.locale = 'zh-CN'

def create_books(num)
  num = 1 if num < 1

  num.times.reduce([]) do |res, idx|
    res << Book.create!(
      name: Faker::Book.title,
      author: Faker::Book.author,
      price: 1 + rand(10000) / 100.0
    )
  end
end

def create_comments(book, num)
  num = 1 if num < 1

  num.times do |idx|
    book.comments.create!(
      user: Faker::Name.name,
      content: "comment [#{book.name}], [#{idx}]"
    )
  end
end

Comment.destroy_all
Book.destroy_all
books = create_books(300)
books.each do |book|
  create_comments(book, rand(40))
end

def create_users(num)
  num = 1 if num < 1
  num.times do |idx|
    User.create!(
      name: Faker::Name.name,
      gender: (rand(2).odd? ? 'm' : 'f'),
      birthday: Faker::Date.between(40.days.ago, 12.days.ago)
    )
  end
end

User.destroy_all
create_users(200)
