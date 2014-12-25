class ChangeUrl < ActiveRecord::Migration
  def change
    rename_column :books, :URL, :url
  end
end
