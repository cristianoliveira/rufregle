require 'test/unit'
require_relative '../../../../lib/translators/free_google/extractor'

##
# Tests for {FreeGoogle::Extractor}
class ExtractorTest < Test::Unit::TestCase
  def setup
    @extractor = Extractor.new
  end

  def test_it_should_return_empty_string
    assert_equal '', @extractor.extract('')
    assert_equal '', @extractor.extract(nil)
  end

  def test_it_should_return_only_the_translation_text
    # given
    rawdata = '[["translation","original",,,10]'
    expected = 'translation'

    # when
    result = @extractor.extract(rawdata)

    # then
    assert_equal expected, result
  end

  def test_it_should_ignore_inside_quotes
    # given
    rawdata = '[["translation\'s","original",,,10]'
    expected = 'translation\'s'

    # when
    result = @extractor.extract(rawdata)

    # then
    assert_equal expected, result
  end

  def test_it_should_ignore_inside_double_quotes
    # given
    rawdata = '[["this has it "", bla bla","original",,,10]'
    expected = 'this has it "", bla bla'

    # when
    result = @extractor.extract(rawdata)

    # then
    assert_equal expected, result
  end
end
