class Item < ActiveRecord::Base
   has_many :items_count
   has_many :orders, :through => :items_count
  
   validates :name, :presence => true
   validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, 
      :numericality => {:greater_than_or_equal_to => 0}
      
   has_attached_file :photo, :styles => {:menu => "100x100"},
     :storage => :s3,
     :bucket => 'pizza-bestellung',
     :s3_credentials => S3_CREDENTIALS
     
   validates_attachment_content_type :photo, :content_type=>['image/jpeg', 'image/png', 'image/gif']    
   validates_attachment_size :photo, :less_then => 1.megabyte
end