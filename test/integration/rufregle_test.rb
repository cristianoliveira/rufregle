#!/bin/env ruby
# encoding: utf-8

require 'test/unit'
require './lib/rufregle.rb'
require './lib/translators/free_google_translator.rb'

class RufregleTest < Test::Unit::TestCase

  def test_english_to_portuguese_hello
    #given
    word = "Hello"
    expected = "Olá"

    #when
    result = Rufregle.new.translate(word, :en , :pt)

    #then
    assert_equal(expected, result[:translated])
  end

  def test_english_to_portuguese_hello_get_original
    #given
    word = "Hello"
    expected = "Hello"

    #when
    result = Rufregle.new.translate(expected, :en , :pt)

    #then
    assert_equal(expected, result[:original])
  end

  def test_prhase_translate
    #given
    phrase = "Isso é uma frase traduzida"
    expected = "This is a translated phrase"

    #when
    result = Rufregle.new.translate(phrase, :pt, :en)

    #then
    assert_equal(expected, result[:translated])
  end

  def test_given_new_translator
    #given
    phrase = "Isso é uma frase traduzida"
    expected = "This is a translated phrase"
    translator = FreeGoogleTranslator.new
    rufregle = Rufregle.new

    #when
    rufregle.translator = translator
    result = rufregle.translate(phrase, :pt, :en)

    #then
    assert_equal(expected, result[:translated])
  end

  def test_invalid_params
    r = Rufregle.new

    assert_raise do #doing it must to raise
      empty_var = ''
      r.translate(nil, nil, nil)
      r.translate(empty_var, empty_var, "#{empty_var}")
      r.translate('All paramns must be informed', nil, nil)
      r.translate('All paramns must be informed', :pt, nil)
    end

  end

end
