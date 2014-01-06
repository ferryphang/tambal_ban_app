# encoding: utf-8

class MarkerUploader < CarrierWave::Uploader::Base
  
  include CarrierWave::MiniMagick

  storage :file
  
  def store_dir
    "uploads/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [32,37]
  end

  def extension_white_list
    %w(png)
  end

end
