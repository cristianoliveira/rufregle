require_relative 'translators/free_google/factory'
##
# Rufregle is a client api for translations
# it uses as default {FreeGoogle::Translator}
#
class Rufregle
  attr_writer :translator

  def initialize()
    @translator = FreeGoogle::Factory.create()
  end

  ##
  # Return a translated text of a given +text+ +from+ language +to+ another language
  #
  # See language codes on {http://sites.google.com/site/tomihasa/google-language-codes}
  #
  # @param text [String] Text to be translated.
  # @param from [String] Language code of text
  # @param to [String] Language code to be translate
  # @raise Error unless all params informed
  # @return [Hash] translated text and the original text from.
  #     Example:
  #     { translated: "Ola mundo", original: "Hello word" }

  def translate(text, from, to)
    raise 'Rufregle: All params must be informed' unless all_present?([text, from, to])
    @translator.translate(text, from, to)
  end

  def all_present?(params)
    params.each {|val| return false if val.nil? || val.empty? }
    return true
  end
end
