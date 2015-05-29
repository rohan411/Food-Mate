class CreateUserChoices < ActiveRecord::Migration
  def up
    create_table :user_choices do |t|
        t.integer :user_id
        t.text :tags
        t.text :item_ids
        t.timestamps
    end
    add_index :user_choices, :user_id
  end

  def down
    drop_table :user_choices
  end
end
