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
    assert_raise RuntimeError do @rufregle.translate(nil, nil, nil) end
    assert_raise RuntimeError do @rufregle.translate("", "", "") end
    assert_raise RuntimeError do @rufregle.translate("aaa", "", "") end
    assert_raise RuntimeError do @rufregle.translate("aaa", "aaa", "") end
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
