require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency_hw.rb'

class CurrencyTest < Minitest::Test

  def test_correct_currency
    assert_equal('USD', Currency.new('USD', 100).code)
  end
end
