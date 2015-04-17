require './lib/requester.rb'
require './lib/translators/translator.rb'
require './lib/parsers/free_google_parser.rb'

class FreeGoogleTranslator < Translator

  GOOGLE_URL_API = "https://translate.google.com/translate_a/"
  GOOGLE_PARAMS  = "single?client=z&sl=%s&tl=%s-CN&ie=UTF-8&oe=UTF-8&dt=t&dt=rm&q=%s"

  def do_translate(text_to_translate, language_from, language_to)

    parameters   = GOOGLE_PARAMS % [ language_from, language_to , text_to_translate]
    url          = GOOGLE_URL_API + parameters

    raw_data     = Requester.request(url) 

    data = FreeGoogleParser.parse_to_hash(raw_data)

  end

end
