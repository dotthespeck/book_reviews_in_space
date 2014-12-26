class ChagneColumnForUserId < ActiveRecord::Migration
  def change
    change_column_null(:books, :user_id, false)
  end
end
