# encoding: utf-8

class DriverBackgroundUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick 
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  version :org do
    process :convert => 'jpg'
  end

  process resize_to_fill: [1600, 900]

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
