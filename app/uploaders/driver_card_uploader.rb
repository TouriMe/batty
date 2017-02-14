# encoding: utf-8

class DriverCardUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  # storage :fog
 
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :org do
    process :convert => 'jpg'
  end

    process :resize_to_fill => [800, 500]

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
