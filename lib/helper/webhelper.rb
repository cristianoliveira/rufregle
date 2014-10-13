require 'net/http'

class WebHelper
  def initialize(language = "english")
    @language = language
  end

  def self.acess_url(url)
    response = Net::HTTP.get(URI.parse(url))
    response 
  end
end
