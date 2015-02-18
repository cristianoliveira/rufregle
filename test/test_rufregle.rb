#!/bin/env ruby
# encoding: utf-8

require 'test/unit'
require './lib/rufregle.rb'

class RufregleTest < Test::Unit::TestCase

  def test_english_to_portuguese_hello
    assert_equal("Olá", Rufregle.new.translate("Hello", :en , :pt))
  end

  def test_prhase_translate
    assert_equal("This is a translated phrase", Rufregle.new.translate('Isso é uma frase traduzida', :pt, :en))
  end

  def test_cached_translate
    r = Rufregle.new
    translate = r.translate("That is cached", :en, :pt)
    assert_equal(translate, r.get_cached_translate.last)
  end

  def test_clean_cache
    r = Rufregle.new
    translate = r.translate("That is cached", :en, :pt)
    r.clean_cache
    assert_equal(true, r.get_cached_translate.empty?)
  end

  def test_static_call
    assert_equal("static call", Rufregle::translate('chamada estática', :pt, :en))
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
