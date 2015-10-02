require 'open-uri'
require 'net/http'
require_relative '../translator'

##
# Implementation of Translator using alternative URL API to
# request translations
class FreeGoogleTranslator
  include Translator

  ENCODE = 'UTF-8'
  GOOGLE_URL_API = 'https://translate.google.com/translate_a/'
  GOOGLE_PARAMS = 'single?client=z&sl=%s&tl=%s-CN&ie=UTF-8&oe=UTF-8'\
                  '&dt=t&dt=rm&q=%s'

  def request(text_to_translate, language_from, language_to)
    parameters = format(GOOGLE_PARAMS,
                        language_from,
                        language_to,
                        text_to_translate)
    url = GOOGLE_URL_API + parameters
    url = URI.encode(url)
    Net::HTTP.get(URI.parse(url))
  end

  ##
  # Extract translation
  # @param rawdata [String] Raw text without formating
  # @return [String] Translated text
  #
  #   Example of how raw data look like:
  #   [[["Ola","Hello",,,10]],,"en"]
  #
  def extract(rawdata)
    return '' if rawdata.nil? || rawdata.empty?

    encoded = rawdata.force_encoding(ENCODE)
    translations = encoded[/\["(.*?)","/]

    translations[2..-4]
  end
end
