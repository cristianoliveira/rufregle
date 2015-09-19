module FreeGoogle
  ##
  # Responsible for extract translated result from a received raw text

  class Extractor
    ENCODE = 'utf-8'

    ##
    # Extract translation
    # @param rawdata [String] Raw text without formating
    # @return [String] Translated text
    #
    #   Example of how raw data look like:
    #   [[["Olá","Hello",,,10]],,"en"]
    #

    def extract(rawdata)
      return "" if rawdata.nil? || rawdata.empty?

      encoded = rawdata.force_encoding(ENCODE)
      translations = encoded[/\["(.*?)","/]

      translations[2..-4]
    end
  end
end
