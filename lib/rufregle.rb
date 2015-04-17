require './lib/translators/free_google_translator.rb'

class Rufregle

  @@translator

  def translator=(translator)
    @@translator = translator
  end

  def translate(text, from_language, to_language)

    validate_params([text, from_language, to_language])
    translator.do_translate text, from_language, to_language

  end

  private
  def translator
    @@translator ||= FreeGoogleTranslator.new
  end

  def validate_params(params)
    if !params.map{ |p| p.nil? || p.empty? }
     raise 'Rufregle: All params must be informed'
    end
  end
end
