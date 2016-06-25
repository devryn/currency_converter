class Currency

  attr_reader :code, :amount

  CODES = {"$" => "USD", "€" => "EUR", "¥" => "JPY"}

  def initialize(code = nil, amount)
    if amount.is_a?(Fixnum) || amount.is_a?(Float)
      @code = code
      @amount = amount
    else
      @code = code
      @amount = amount[/\d./].to_f
      if CODES.key?(/\D/)
        @code = CODES.fetch(amount[/\D/])
      end
    end
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
