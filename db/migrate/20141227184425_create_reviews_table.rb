class CreateReviewsTable < ActiveRecord::Migration
  def change
    create_table :reviews_tables do |t|
      t.integer :user_id, null:false
      t.integer :book_id, null:false
      t.text :review, null:false

      t.timestamps

    end
  end
end
