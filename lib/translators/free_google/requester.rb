require 'open-uri'
require 'net/http'

module FreeGoogle
  ##
  # Responsible for HTTP requests
  class Requester
    ##
    # Http request using GET method.
    def request(url)
      url = URI.encode(url)
      Net::HTTP.get(URI.parse(url))
    end
  end
end
