# frozen_string_literal: true

# Class for url validation
class UrlValidator
  def self.call(string)
    if url?(string) && image?(string)
      true
    else
      puts 'The url is not valid'
      false
    end
  end

  def self.url?(string)
    string.match?(%r{^(http://||https://)(.+)(\.\w+)/?$})
  end

  def self.image?(string)
    string.match?(/^.+\.(jpg||png||jpeg)$/)
  end
end
