##
# A Blueprint of how a Translator class must be.
module Translator
  ##
  # Return a translated text of a given +text+ +from+ language +to+
  # another language
  #
  # @param text [String] text to be translated.
  # @param from [String] language from
  # @param to [String] language to
  # @return [Hash] translated and original text
  #      Example:
  #         input "hi", :en, :pt
  #         output {translated: "ola", original: "hi"}
  #
  def translate(text_to_translate, from, to)
    data = request(text_to_translate, from, to)
    translation = extract(data)

    { translated: translation, original: text_to_translate }
  end
end
