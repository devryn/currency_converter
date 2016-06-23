require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency_hw.rb'

class CurrencyTest < Minitest::Test


  def test_correct_currency
    assert_equal('USD', Currency.new('USD', 100).code)
  end

  def test_correct_amount
    assert_equal(100, Currency.new('USD', 100).amount)
  end

  def test_doesnt_equal
    refute_equal('USD', 100, Currency.new('E', 120))
  end

  def test_add
    added_currency = (Currency.new('USD', 50) + Currency.new('USD', 50))
    assert_equal Currency.new('USD', 100), added_currency
  end

  def test_subtract
    subtracted_currency = (Currency.new('USD', 50) - Currency.new('USD', 10))
    refute_equal Currency.new('USD', 40), subtracted_currency
  end

  def test_multiply
    multiplied_currency = Currency.new('USD', 5) * 5
    assert_equal multiplied_currency, Currency.new('USD', 25)
  end
end
