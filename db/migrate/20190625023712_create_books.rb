class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name,    null: false
      t.string :author,  null: false
      t.decimal :price,  null: false
      t.string :picture, null: true
      t.timestamps       null: false
    end
  end
end
