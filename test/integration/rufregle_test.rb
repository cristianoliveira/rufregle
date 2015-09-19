#!/bin/env ruby
# encoding: utf-8

require 'test/unit'
require_relative '../../lib/rufregle.rb'
require_relative '../../lib/translators/free_google/factory.rb'

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
    translator = FreeGoogle::Factory.create()
    rufregle = Rufregle.new

    #when
    rufregle.translator = translator
    result = rufregle.translate(phrase, :pt, :en)

    #then
    assert_equal(expected, result[:translated])
  end


end
