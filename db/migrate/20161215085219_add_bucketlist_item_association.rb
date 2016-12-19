class AddBucketlistItemAssociation < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :bucketlist_id, :integer
    add_foreign_key :items, :bucketlists, column: :bucketlist_id, primary_key: "id"
  end
end
