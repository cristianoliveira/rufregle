require_relative 'lib/rufregle.rb'

def main
    Encoding.default_external="UTF-8"
    result = Rufregle.translate(ARGV[0], "en", "pt")
    p "RESULT #{result[0]}"

end


main()
