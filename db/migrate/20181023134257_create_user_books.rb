class CreateUserBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_books do |t|
      t.integer :read
      t.boolean :favorite, default: false
      t.boolean :reading, default: false
      t.boolean :request, default: false
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
