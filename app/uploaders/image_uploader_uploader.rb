# encoding: utf-8

class ImageUploaderUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # storage :file
  storage :fog
 
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :cropped do
    process resize_to_fill: [800, 500]
  end
 
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
