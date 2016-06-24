require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency_hw.rb'

class ConverterTest < Minitest::Test


  def test_convert_USD_to_JPY_x1
    currency_converter = CurrencyConverter.new( { USD: 1.0, EUR: 0.88, JPY: 106.58 } )

    expect = Currency.new("USD", 1.0)
    starting_currency = Currency.new("JPY", 106.58)
    actual = currency_converter.convert(starting_currency, :USD)

    assert_equal(expect, actual)
  end

  def test_convert_USD_to_JPY_x2
    currency_converter = CurrencyConverter.new( { USD: 1.0, EUR: 0.88, JPY: 106.58 } )

    expect = Currency.new("USD", 2.0)
    starting_currency = Currency.new("JPY", 213.16)
    actual = currency_converter.convert(starting_currency, :USD)

    assert_equal(expect, actual)
  end

  def test_convert_EUR_to_USD
    currency_converter = CurrencyConverter.new( { USD: 1.0, EUR: 0.88, JPY: 106.58 } )

    expect = Currency.new("EUR", 88)
    starting_currency = Currency.new("USD", 100)
    actual = currency_converter.convert(starting_currency, :EUR)

    assert_equal(expect, actual)
  end

  def test_convert_JPY_to_USD
    currency_converter = CurrencyConverter.new( { USD: 1.0, EUR: 0.88, JPY: 106.58 } )

    expect = Currency.new("JPY", 106.58)
    starting_currency = Currency.new("USD", 1.0)
    actual = currency_converter.convert(starting_currency, :JPY)

    assert_equal(expect, actual)
  end

  def test_convert_EUR_to_JPY
    currency_converter = CurrencyConverter.new( { USD: 1.0, EUR: 0.88, JPY: 106.58 } )

    expect = Currency.new("EUR", 88)
    starting_currency = Currency.new("JPY", 10658)
    actual = currency_converter.convert(starting_currency, :EUR)

    assert_equal(expect, actual)
  end

  def test_convert_USD_to_EUR
    currency_converter = CurrencyConverter.new( { USD: 1.0, EUR: 0.88, JPY: 106.58 } )

    expect = Currency.new("USD", 300)
    starting_currency = Currency.new("EUR", 264)
    actual = currency_converter.convert(starting_currency, :USD)

    assert_equal(expect, actual)
  end

  def test_convert_JPY_to_EUR
    currency_converter = CurrencyConverter.new( { USD: 1.0, EUR: 0.88, JPY: 106.58 } )

    expect = Currency.new("JPY", 106.58)
    starting_currency = Currency.new("USD", 1.0)
    actual = currency_converter.convert(starting_currency, :JPY)

    assert_equal(expect, actual)
  end

end
