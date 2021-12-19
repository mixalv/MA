# frozen_string_literal: true

require_relative 'image_uploader'

print 'Enter an image url: '
image_url = gets.chomp
print 'Enter image name(click enter to skip): '
image_name = gets.chomp
image_name = nil if image_name.empty?
print 'Enter the path to the file(click enter to skip): '
image_path = gets.chomp
image_path = nil if image_path.empty?
image = ImageUploader.new(image_url, image_name, image_path)
image.call
