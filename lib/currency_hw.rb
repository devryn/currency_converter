class DifferentCurrencyCodeError < StandardError
  def message
    "Currency types are not consistent, cannot be added or subtracted."
  end
end

class UnknownCurrencyCodeError < StandardError
  def message
    "Unknown currency code. Please input a known code."
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
    return false unless other.is_a?(Currency)
    @amount == other.amount
  end

  def !=(other)
    return false until other.is_a?(Currency)
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


class CurrencyConverter
  attr_reader :codes
  def initialize(codes)
    @codes = codes
  end

  def convert(currency, convert_to_code)
    raise UnknownCurrencyCodeError unless codes.is_a?(Hash)
    codes = { USD: 1.0, EUR: 0.88, JPY: 106.58 }
    rate = codes.fetch(convert_to_code.to_sym) / codes.fetch(currency.code.to_sym)
    final_amount = currency.amount * rate
    Currency.new(convert_to_code, final_amount)
  end
end
