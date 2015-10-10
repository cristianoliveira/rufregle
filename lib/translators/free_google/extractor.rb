##
# Extract translation from raw data.
module Extractor
  ENCODE = 'UTF-8'

  ##
  # Extract translation
  # @param rawdata [String] Raw text without formating
  # @return [String] Translated text
  #
  #   Example of how raw data look like:
  #   [[["Ola","Hello",,,10]],,"en"]
  #
  def self.extract(rawdata)
    return '' if rawdata.nil? || rawdata.empty?

    encoded = rawdata.force_encoding(ENCODE)
    translations = encoded[/\["(.*?)","/]
    translations[2..-4]
  end
end
