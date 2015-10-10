##
# Request translation using a Given API and its params
module Requester
  ##
  # Request using GET method data from a +uri+ API passing its +params+
  #
  # @param uri [String] Api Url
  # @param params [Hash] Api params
  # @return [String] Response body
  def self.request(uri, params)
    uri = URI(uri)
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(uri)

    unless response.is_a?(Net::HTTPSuccess)
      throw RequestException.new('Service unavailable')
    end

    response.body
  end
end

class RequestException < Exception
end
