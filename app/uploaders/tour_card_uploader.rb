# encoding: utf-8

class TourCardUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  version :org do
    process :resize_to_fill => [800, 500]
  end
  
  version :processed do
    process :resize_to_fill => [800, 500]
  end
  
  version :square do
    process :resize_to_fill => [ 500, 500 ]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
