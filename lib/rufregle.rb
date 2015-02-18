require 'open-uri'
require 'net/http'

class Rufregle

  GOOGLE_URL_API = "http://translate.google.com/translate_a/"
  GOOGLE_PARAMS  = "t?client=t&text=%s&hl=%s&sl=%s&tl=%s&ie=UTF-8&oe=UTF-8&multires=1&otf=1&ssel=3&tsel=3&sc=1"

  @cachedTranslate

  def self.translate(text_to_translate, language_from, language_to)
    r = Rufregle.new
    r.translate(text_to_translate, language_from, language_to)
  end

  def translate(text_to_translate, language_from, language_to)

    validate_params([text_to_translate, language_from, language_to])

    text_encoded   = URI::encode(text_to_translate)

    parameters   = GOOGLE_PARAMS % [ text_encoded , language_from, language_from, language_to ]
    url      = GOOGLE_URL_API + parameters

    raw_data     = Net::HTTP.get(URI.parse(url))

    text   = cast_raw_data(raw_data)

    @cachedTranslate ||= Array.new
    @cachedTranslate << text.first

    text.first

  end

  def get_cached_translate
    @cachedTranslate
  end

  def clean_cache
    @cachedTranslate.clear
  end

  private
  def cast_raw_data(data)
    data = data.force_encoding('utf-8')

    data = data.scan(/\"(.*?)\"/).to_a

    data[0]
  end

  def validate_params(params)
    if !params.map{ |p| p.nil? || p.empty? }
     raise 'Rufregle: All params must be informed'
    end
  end
end
