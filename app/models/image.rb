class Image < ActiveRecord::Base
  belongs_to :imagable, polymorphic: true
  validates_presence_of :url, :alt_text
  mount_uploader :url, ImageUploaderUploader
end
