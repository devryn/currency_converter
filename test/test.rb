require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency_hw.rb'

class CurrencyTest < Minitest::Test

  def test_correct_currency
    assert_equal('USD', Currency.new('USD', 100).code)
  end

  def test_correct_amount
    assert_equal('100', Currency.new('USD', '100').amount)
  end

  def test_doesnt_equal
    refute_equal('USD', '100', Currency.new('E', '120'))
  end

  #def test_add
  #  assert_equal("2", Currency.new('USD', "1+1"))
  #end -- not working
end
