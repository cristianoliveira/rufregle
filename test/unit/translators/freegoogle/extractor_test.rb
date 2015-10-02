require 'test/unit'
require_relative '../../../../lib/translators/free_google/free_google_translator'

##
# Tests for {FreeGoogle::Extractor}
class ExtractorTest < Test::Unit::TestCase
  def setup
    @translator = FreeGoogleTranslator.new
  end

  def test_it_should_return_empty_string
    assert_equal '', @translator.extract('')
    assert_equal '', @translator.extract(nil)
  end

  def test_it_should_return_only_the_translation_text
    # given
    rawdata = '[["translation","original",,,10]'
    expected = 'translation'

    # when
    result = @translator.extract(rawdata)

    # then
    assert_equal expected, result
  end

  def test_it_should_ignore_inside_quotes
    # given
    rawdata = '[["translation\'s","original",,,10]'
    expected = 'translation\'s'

    # when
    result = @translator.extract(rawdata)

    # then
    assert_equal expected, result
  end

  def test_it_should_ignore_inside_double_quotes
    # given
    rawdata = '[["this has it "", bla bla","original",,,10]'
    expected = 'this has it "", bla bla'

    # when
    result = @translator.extract(rawdata)

    # then
    assert_equal expected, result
  end
end
