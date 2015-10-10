require 'open-uri'
require 'net/http'

require_relative 'extractor'
require_relative '../translator'

##
# Implementation of Translator using alternative URL API to
# request translations
class FreeGoogleTranslator < Translator
  ENCODE = 'UTF-8'

  def api_url
    'https://translate.google.com/translate_a/single?'
  end

  def params(text, from_lang, to_lang)
    {
      client: 'z',
      ie: ENCODE,
      dt: 't',
      sl: from_lang,
      tl: to_lang,
      q: text
    }
  end

  private

  def extract(data)
    Extract.extract(data)
  end
end
