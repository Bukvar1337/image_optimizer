class OptimizeImageJob < ApplicationJob
  queue_as :default

  def perform(email,id)
    image = Image.find(id)
    compressed_image = CompressedImage.new(image: image.image)
     if compressed_image.save && (compressed_image.image.size < image.image.size)
      body = "Here is your image:"
      url = "#{ENV['GET_IMAGE_URL']}/#{compressed_image.id}/download"
     else
       body = "Sorry, its impossible to compress your image."
       url = nil
     end
    ImageMailer.url(email, body, url).deliver
  end
end
