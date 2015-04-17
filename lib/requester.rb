require 'open-uri'
require 'net/http'

class Requester
  def self.request(url)
    url = URI::encode(url)
    Net::HTTP.get(URI.parse(url))
  end
end
