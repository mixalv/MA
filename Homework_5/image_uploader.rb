# frozen_string_literal: true

require_relative 'url_validator'
require_relative 'faraday_request_wrapper'
require 'faraday'
# Class for loading the image
class ImageUploader
  attr_accessor :image_name, :image_url, :directory

  def initialize(image_url, image_name = nil, directory = nil)
    @image_url = image_url
    @image_name = image_name
    @directory = directory
  end

  def call
    save_image
  end

  private

  def validate
    UrlValidator.call(image_url)
  end

  def upload
    FaradayRequestWrapper.call do
      Faraday.get(image_url)
    end
  end

  def default_image_name
    image_url.match(%r{^.+/(.+)\.\w+$})[1]
  end

  def image_extension
    image_url.match(/^.+\.(\w+)$/)[1]
  end

  def valid_directory?
    File.directory?(directory)
  end

  def file_path
    if directory && valid_directory?
      "#{directory}/#{image_name || default_image_name}.#{image_extension}"
    else
      "#{image_name || default_image_name}.#{image_extension}"
    end
  end

  def save_image
    image = upload
    return unless validate && image

    File.open(file_path, 'wb') do |file|
      file.write(image.body)
      puts 'The image successfully saved'
    end
  end
end
