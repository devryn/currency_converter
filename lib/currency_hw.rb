class DifferentCurrencyCodeError < StandardError
  def message
    "Currency types are not consistent, cannot be added or subtracted."
  end
end

class NaN < StandardError
  def message
    "This is not a number."
  end
end

class Currency
  attr_reader :code, :amount
  def initialize(code, amount)
    @code = code
    @amount = amount
  end

  def ==(other)
    return false unless other.is_a?(Currency) #are you currency?
    #@code == other.code #is the currency code the same?
    @amount == other.amount
  end

  def !=(other)
    return false until other.is_a?(Currency)
    #@code != other.code
    @amount != other.amount
  end

  def +(other)
    raise  DifferentCurrencyCodeError unless other.is_a?(Currency)
    final_amount = @amount + other.amount
    Currency.new(@code, final_amount)
  end

  def -(other)
    raise DifferentCurrencyCodeError unless other.is_a?(Currency)
    final_amount = @amount - other.amount
    if final_amount < 0
      STDERR.puts ("WARNING : Amount was going to be #{final_amount}. Cannot have negative Currency.")
    else
      Currency.new(@code, final_amount)
    end

    def *(other)
      raise NaN unless other.is_a?(Fixnum) || other.is_a?(Float)
      final_amount = @amount * other
      Currency.new(@code, final_amount)
    end
  end
end

class Convert

end
