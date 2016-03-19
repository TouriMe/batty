# encoding: utf-8

class DriverAvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  # storage :file
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :square do
    process :resize_to_fill => [150, 150]
  end

  version :org do
    process :convert => 'jpg'
  end

  process :resize_to_fill => [300, 300]

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
