class Types::CommentType < Types::BaseObject
  description "Comments"

  field :id, ID, null: false
  field :book, Types::BookType, null: false
  field :user, String, null: false
  field :content, String, null: false
  field :created_at, String, null: false
  field :updated_at, String, null: false
end
