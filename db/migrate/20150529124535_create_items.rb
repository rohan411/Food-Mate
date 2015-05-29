class CreateItems < ActiveRecord::Migration
  def up
    create_table :items do |t|
        t.string :name
        t.integer :collection_id
        t.timestamps
    end
    add_attachment :items, :logo
    add_index :items, :name
    add_index :items, :collection_id
  end

  def down
    drop_table :items
  end
end
