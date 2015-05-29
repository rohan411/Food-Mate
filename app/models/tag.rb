class Tag < ActiveRecord::Base
  has_and_belongs_to_many :items, :class_name => "Item", :join_table => 'items_tags' 
end