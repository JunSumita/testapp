class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # リサイズしたり画像形式を変更するのに必要
  include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # 画像の上限を200pxにする
  process :resize_to_fit => [200, 200]

  # 保存形式をJPGにする
  process :convert => 'jpg'

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end
  ## If ONLY "thumb" version is to be cropped
  version :jumbo do
    resize_to_limit(600,600)
  end

  # Create different versions of your uploaded files:
  # サムネイルを生成する設定
  version :thumb do
    process :resize_to_fit => [50,50]
  end
  version :resized do
    process :crop
    process resize_to_fill: [600, 600]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end

  private

      def crop
        return if [model.image_crop_x, model.image_crop_y, model.image_crop_w, model.image_crop_h].all?
        manipulate! do |img|
          crop_x = model.image_crop_x.to_i
          crop_y = model.image_crop_y.to_i
          crop_w = model.image_crop_w.to_i
          crop_h = model.image_crop_h.to_i
          img.crop "#{crop_w}x#{crop_h}+#{crop_x}+#{crop_y}"
          img = yield(img) if block_given?
          img
        end
      end
end
