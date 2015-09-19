##
# A Blueprint of how a Translator class must be.

class Translator
  ##
  # Return a translated text of a given +text+ +from+ language +to+ another language
  #
  # @param text [String] text to be translated.
  # @param from [String] language from
  # @param to [String] language to
  # @return [String] translated text

  def translate(text, from, to)
    raise "Method do_translate must be implemented"
  end
end
