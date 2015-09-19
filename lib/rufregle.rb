require_relative 'translators/free_google_translator'

class Rufregle
  attr_writer :translator

  def translate(text, from, to)
    raise 'Rufregle: All params must be informed' if empty?([text, from, to])
    translator.do_translate(text, from, to)
  end

  private
  def translator
    @translator || FreeGoogleTranslator.new
  end

  def empty?(params)
    !params.map{ |p| p.nil? || p.empty? }
  end
end
