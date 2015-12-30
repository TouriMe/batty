# encoding: utf-8

class DriverBackgroundUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick 
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  version :processed do
    process :resize_to_fill => [800, 450]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
