class AddBooksTable < ActiveRecord::Migration

  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author
      t.text :description, null:false
      t.string :URL, null:false
      t.integer :user_id

      t.timestamps

    end
  end
end
