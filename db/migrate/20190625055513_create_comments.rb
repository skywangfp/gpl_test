class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :book_id, null: false, limit: 8
      t.string :user,     null: false
      t.string :content,  null: false

      t.timestamps        null: false
    end

    add_foreign_key :comments, :books
  end
end
