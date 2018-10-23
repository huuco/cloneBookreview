  class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.text :content
      t.integer :user_id
      t.string :book_name
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
