require 'open-uri'
require 'net/http'

##
# Responsible for HTTP requests
module FreeGoogle
  class Requester

    ##
    # Http request using GET method.

    def request(url)
      url = URI::encode(url)
      Net::HTTP.get(URI.parse(url))
    end
  end
end
