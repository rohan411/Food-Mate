class Item < ActiveRecord::Base
  has_and_belongs_to_many :tags, :class_name => "Tag", :join_table => 'items_tags' 
  belongs_to :collection 
  has_attached_file :logo, 
  :styles => {
               :medium => {:geometry => "480x360", :format => "webp"},
               :small =>  {:geometry => "320x256", :format => "webp"} 
              }
 # :url => "/controllers/original/:style/:basename.:extension"
 def get_url
  "#{Rails.root}/public" + self.logo.url(:medium)
 end

 def to_item_hash
   return {
    :item_name => self.name,
    :item_image_url => self.get_url,
    :collection_id => self.collection_id
   }
 end

end

