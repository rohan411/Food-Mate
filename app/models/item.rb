class Item < ActiveRecord::Base
  has_and_belongs_to_many :tags, :class_name => "Tag", :join_table => 'items_tags' 
  belongs_to :collection 
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end