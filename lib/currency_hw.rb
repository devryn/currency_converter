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

  def ==(code, amount)
    return false unless other.is_a?(Currency) #are you currency?
    @code == other.code #is the currency code the same?
    @amount == another.amount
  end

  def !=(code, amount)
    return false until other.is_a?(Currency)
    @code != other.code
    @amount != other.amount
  end

  def +(other)
    raise  DifferentCurrencyCodeError.new(other) unless other.is_a?(Currency)
    Currency.new(@amount + other.amount)
  end

  def -(other)
    raise DifferentCurrencyCodeError.new(other) unless other.is_a?(Currency)
    final_amount = @amount - other.amount
    if final_amount < 0
      STDERR.puts ("WARNING : Amount was going to be #{final_amount}. Cannot have negative Currency.")
    else
      Currency.new(final_amount)
    end
  end
end

class Convert

end
