class ImagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def compress
    image = Image.new(image_params)
    if image.save
      OptimizeImageJob.perform_later(params["email"], image.id)
      render json: { success: true, message: "Image has been uploaded." }
    else
      render json: { success: false, errors: image.errors.as_json }, status: :unprocessable_entity
    end
  end

  def download
    compressed_image = CompressedImage.find(params[:id]).image
    data = compressed_image.read
    type = compressed_image.url.split(".")[-1]
    send_data(data, type: "image/#{type}", disposition: 'attachment')
  end

  private

  def image_params
    params.permit(:image)
  end
end
