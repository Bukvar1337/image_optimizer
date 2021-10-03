class ImageMailer < ApplicationMailer
  default from: ENV['FROM_MAIL']

  def url(to, body, url = nil)
    @url = url
    @body = body
    mail to: to, subject: "url"
  end
end
