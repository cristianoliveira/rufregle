require 'test/unit'
require_relative '../../lib/rufregle'

class RufregleTest < Test::Unit::TestCase

  def setup
    @translator = StubedTranslator.new
    @rufregle = Rufregle.new
    @rufregle.translator = @translator
  end

  def test_it_should_return_fail_message
    fail_message = 'Rufregle: All params must be informed'
    assert_equal fail_message, @rufregle.translate(nil, nil, nil)
    assert_equal fail_message, @rufregle.translate('', '', '')
    assert_equal fail_message, @rufregle.translate('aaa', '', '')
    assert_equal fail_message, @rufregle.translate('aaa', 'aaa', '')
  end

  def test_it_should_not_raise_error
    # given
    translation = 'Text translated'
    @translator.result = translation

    # then
    assert_equal translation, @rufregle.translate('aaa', 'aaa', 'aaa')
  end

  class StubedTranslator
    attr_accessor :result

    def translate(_text, _from, _to)
      @result
    end
  end
end
