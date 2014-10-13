require 'test/unit'
require 'rufregle'

class RufregleTest < Test::Unit::TestCase
  def test_english_hello
    assert_equal "Olá", Rufregle.translate("Hello","en","pt")[0][0]
  end
end
