class FreeGoogleParser
  ENCODE = 'utf-8'

  def self.parse_to_hash(raw)
    data = Hash.new

    raw = raw.force_encoding(ENCODE)
    raw = raw.scan(/\"(.*?)\"/).to_a

    data[:translated], data[:original] = raw[0][0], raw[1][0]
    data
  end
end
