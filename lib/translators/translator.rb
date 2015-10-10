require_relative 'requester'

##
# A Blueprint of how a Translator class must be.
class Translator
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
  def translate(text, from, to)
    data = Requester.request(api_url, params(text, from, to))
    translation = extract(data)

    { translated: translation, original: text_to_translate }
  end

  private

  ##
  # Translation service API Url
  # @return [String] url
  def api_url
  end

  ##
  # Format params to be passed to the API
  # @param text [String] text to be translated.
  # @param from [String] language from
  # @param to [String] language to
  # @return [Hash] Formatted params
  def params(_text, _from, _to)
  end

  ##
  # Translation extraction from the API response
  # @param [String] Raw data
  # @return [String] Extracted translation
  def extract(_data)
  end
end
