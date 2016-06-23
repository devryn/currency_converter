require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency_hw.rb'

class CurrencyTest < Minitest::Test

  def test_correct_currency
    assert_equal('USD', Currency.new('USD', 100).code)
  end

  def test_correct_amount
    assert_equal('100', Currency.new('USD', "100").amount)
  end
end
