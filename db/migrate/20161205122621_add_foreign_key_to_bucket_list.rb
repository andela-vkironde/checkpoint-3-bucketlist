class AddForeignKeyToBucketList < ActiveRecord::Migration[5.0]
  def change
    add_column :bucket_lists, :user_id, :integer
    add_foreign_key :bucket_lists, :users, column: :user_id, primary_key: "id"
  end
end
