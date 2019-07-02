class Types::UserType < Types::BaseObject
  description "A User"

  field :id, ID, null: false
  field :name, String, null: false
  field :gender, String, null: false
  field :birthday, String, null: false
  field :created_at, String, null: false
  field :updated_at, String, null: false
end
