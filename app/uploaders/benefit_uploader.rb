class BenefitUploader < CarrierWave::Uploader::Base

  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  # storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :square do
    process :resize_and_pad => [80, 80, background = :transparent]
  end

  version :org do
    process :resize_and_pad => [300, 300, background = :transparent]
    process :convert => 'jpg'
  end


  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
