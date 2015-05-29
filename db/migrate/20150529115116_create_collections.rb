class CreateCollections < ActiveRecord::Migration
  def up
    create_table :collections do |t|
      t.string :name
      t.timestamps
    end
    add_index :collections, :name
  end

  def down
    drop_table :collections
  end
end
