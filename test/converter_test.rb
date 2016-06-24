require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency_hw.rb'

class ConverterTest < Minitest::Test


  def test_correct_conversion
    currency_converter = CurrencyConverter.new( { USD: 1.0, EUR: 0.88, JPY: 106.58 } )

    expect = Currency.new("USD", 1.0)
    starting_currency = Currency.new('JPY', 106.58)
    actual = currency_converter.convert(starting_currency, :USD)

    assert_equal(expect, actual)
  end

  def test_convert_with_different_result
    currency_converter = CurrencyConverter.new( { USD: 1.0, EUR: 0.88, JPY: 106.58 } )

    expect = Currency.new("USD", 2.0)
    starting_currency = Currency.new('JPY', 213.16)
    actual = currency_converter.convert(starting_currency, :USD)

    assert_equal(expect, actual)
  end
end
