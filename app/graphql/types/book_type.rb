class Types::BookType < Types::BaseObject
  description "A Book"

  field :id, ID, null: false
  field :name, String, null: false
  field :author, String, null: false
  field :price, Float, null: false
  field :comments, [Types::CommentType], null: true
    # And fields can have their own descriptions:
    # description: "This post's comments, or null if this post has comments disabled."
end
