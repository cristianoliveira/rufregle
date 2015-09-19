##
# Implementation of Translator using alternative URL API to request translations

module FreeGoogle
  class Translator

    GOOGLE_URL_API = "https://translate.google.com/translate_a/"
    GOOGLE_PARAMS  = "single?client=z&sl=%s&tl=%s-CN&ie=UTF-8&oe=UTF-8&dt=t&dt=rm&q=%s"

    def initialize(extractor, http_requester)
      @translation_extractor = extractor
      @http_requester = http_requester
    end

    def translate(text_to_translate, language_from, language_to)
      parameters = GOOGLE_PARAMS % [ language_from, language_to , text_to_translate]
      url = GOOGLE_URL_API + parameters

      raw_data = @http_requester.request(url)
      translated = @translation_extractor.extract(raw_data)

      {translated: translated, original: text_to_translate}
    end
  end
end
