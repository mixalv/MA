# frozen_string_literal: true

require 'faraday'
# A wrapper for faraday request
class FaradayRequestWrapper
  def self.call
    tries = 0
    begin
      yield
    rescue Faraday::BadRequestError, Faraday::ServerError, Faraday::ConnectionFailed, Faraday::ResourceNotFound => e
      tries += 1
      retry if tries < 3
      puts e.message
    end
  end
end
