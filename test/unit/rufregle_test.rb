require 'test/unit'
require_relative '../../lib/rufregle'
require_relative '../../lib/rufregle'

class RufregleTest < Test::Unit::TestCase

  def setup
    @translator = StubedTranslator.new
    @rufregle = Rufregle.new
    @rufregle.translator = @translator
  end

  def test_it_should_raise_error
    assert_raise { @rufregle.translate(nil, nil, nil) }
    assert_raise { @rufregle.translate("", "", "") }
    assert_raise { @rufregle.translate("aaa", "", "") }
    assert_raise { @rufregle.translate("aaa", "aaa", "") }
  end

  def test_it_should_not_raise_error
    # given
    translation = "Text translated"
    @translator.result = translation

    # then
    assert_equal translation, @rufregle.translate("aaa", "aaa", "aaa")
  end

  class StubedTranslator
    attr_accessor :result

    def translate(text, from, to)
      return @result
    end
  end
end
