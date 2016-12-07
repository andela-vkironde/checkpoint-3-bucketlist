class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.boolean :done, default: false
      t.references :bucket_lists, foreign_key: true

      t.timestamps null: false
    end
  end
end
