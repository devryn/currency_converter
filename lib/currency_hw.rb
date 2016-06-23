class DifferentCurrencyCodeError < StandardError
  def message(other)
    "Currency types are not consistent, cannot be added or subtracted."
  end
end

class Currency
  attr_reader :code, :amount
  def initialize(code, amount)
    @code = code
    @amount = amount
  end

  def ==
    return false unless other.is_a?(Currency) #are you currency?
    @code == other.code #is the currency code the same?
    @amount == another.amount
  end

  def !=
    return false until other.is_a?(Currency)
    @code != other.code
    @amount != other.amount
  end

  def +(other)
    raise  DifferentCurrencyCodeError.new(other) unless other.is_a?(Currency)
    Currency.new(@value + other.value)
  end
end

class Convert

end
