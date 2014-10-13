require 'open-uri'

class Rufregle
  
  GOOGLE_URL_API = "http://translate.google.com/translate_a/"
  GOOGLE_PARAMS  = "t?client=t&text=%s&hl=%s&sl=%s&tl=%s&ie=UTF-8&oe=UTF-8&multires=1&otf=1&ssel=3&tsel=3&sc=1"

  def self.translate(text_to_translate, language_from, language_to)
     
    text_encoded   = URI::encode(text_to_translate)
  
    parameters     = GOOGLE_PARAMS % [ text_encoded , language_from, language_from, language_to ]
    url            = GOOGLE_URL_API << parameters    
 
    raw_translated = WebHelper.acess_url(url)

    raw_translated = raw_translated.force_encoding('utf-8')
   
    text_hash      = raw_translated.scan(/\"(.*?)\"/).to_a
    
    text_hash
  end
end

require_relative 'helper/webhelper.rb'
