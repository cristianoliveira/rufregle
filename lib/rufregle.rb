require_relative 'translators/free_google/free_google_translator'
##
# Rufregle is a client api for translations
# it uses as default {FreeGoogle::Translator}
class Rufregle
  attr_writer :translator

  FAIL = 'Rufregle: All params must be informed'

  ##
  # Return a translated text of a given +text+ +from+ language +to+ another
  # language
  #
  # See language codes on
  #   {http://sites.google.com/site/tomihasa/google-language-codes}
  #
  # @param text [String] Text to be translated.
  # @param from [String] Language code of text
  # @param to [String] Language code to be translate
  # @raise Error unless all params informed
  # @return [Hash] translated text and the original text from.
  #     Example:
  #     { translated: "Ola mundo", original: "Hello word" }
  def translate(text, from, to)
    return FAIL unless all_present?([text, from, to])
    @translator.translate(text, from, to)
  end

  private

  def all_present?(params)
    params.each { |val| return false if val.nil? || val.empty? }
    true
  end

  def translator
    @translator || FreeGoogleTranslator.new
  end
end
