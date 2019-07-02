class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :name,      null: false,  limit: 16
      t.string  :gender,    null: false,  limit: 16
      t.date    :birthday,  null: false
      t.timestamps          null: false
    end

    add_index :users, :birthday
  end
end
