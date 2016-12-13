class AddForeignKeyToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :bucket_list_id, :integer
    add_foreign_key :items, :bucket_lists, column: :bucket_list_id, primary_key: "id" 
  end
end
