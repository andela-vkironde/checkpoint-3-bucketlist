class AddBucketlistItemAssociation < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :bucket_list_id, :bucketlist_id
    add_foreign_key :items, :bucketlists, column: :bucketlist_id, primary_key: "id"
  end
end
