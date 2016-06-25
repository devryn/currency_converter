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
