require 'open-uri'
require 'net/http'
require_relative '../translator'

##
# Implementation of Translator using alternative URL API to
# request translations
class FreeGoogleTranslator
  include Translator

  ENCODE = 'UTF-8'
  GOOGLE_URL_API = 'https://translate.google.com/translate_a/single?'
  PARAMS = {
    client: 'z',
    ie: ENCODE,
    dt: 't'
  }

  def request(text_to_translate, language_from, language_to)
    PARAMS['sl'] = language_from
    PARAMS['tl'] = language_to
    PARAMS['q'] = text_to_translate

    uri = URI(GOOGLE_URL_API)
    uri.query = URI.encode_www_form(PARAMS)
    response = Net::HTTP.get_response(uri)

    unless response.is_a?(Net::HTTPSuccess)
      throw FreeGoogleTranslationException.new('Service unavailable')
    end

    response.body
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

class FreeGoogleTranslationException < Exception
end
