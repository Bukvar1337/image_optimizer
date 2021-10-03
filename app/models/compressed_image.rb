class CompressedImage < ApplicationRecord
  mount_uploader :image, CompressedUploader
end
