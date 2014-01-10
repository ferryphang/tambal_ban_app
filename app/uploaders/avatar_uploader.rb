# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fit => [800, 800]

  version :thumb do
    process :resize_to_fill => [100,100]
  end

  def extension_white_list
    %w(jpg jpeg png gif)
  end

  def default_url
     ActionController::Base.helpers.asset_path("user/user_default.jpg")
  end

end
