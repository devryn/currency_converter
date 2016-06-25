class UnknownCurrencyCodeError < StandardError
  def message
    "Unknown currency code. Please input a known code."
  end
end
