class Types::CommentType < Types::BaseObject
  description "Comments"

  field :id, ID, null: false
  field :book, Types::BookType, null: false
  field :user, String, null: false
  field :content, String, null: false
    # And fields can have their own descriptions:
    # description: "This post's comments, or null if this post has comments disabled."
end
