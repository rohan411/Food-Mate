class Item < ActiveRecord::Base
  has_and_belongs_to_many :tags, :class_name => "Tag", :join_table => 'items_tags' 
  belongs_to :collection 
  has_attached_file :logo, 
  :styles => {
               :medium => {:geometry => "480x360", :format => "webp"},
               :small =>  {:geometry => "320x256", :format => "webp"} 
              },
  :storage => :s3,
  :s3_credentials => Rails.root.join("config/s3.yml"),
  :s3_host_name => 's3-ap-southeast-1.amazonaws.com',
  :s3_host_alias => ENV['IMAGES_CLOUDFRONT_CNAME'],
  :url => ':s3_alias_url',
  :path => ":class/:attachment/:id/:style"

 def get_url
  self.logo.url(:medium)
 end

 def to_item_hash
   return {
    :item_id => self.id,
    :item_name => self.name,
    :item_image_url => self.get_url,
    :collection_id => self.collection_id
   }
 end

end

