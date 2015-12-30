# encoding: utf-8

class DriverCardUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  storage :fog
 
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :processed do
    process :resize_to_fill => [400, 250]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
