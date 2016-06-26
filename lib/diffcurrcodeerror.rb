class DifferentCurrencyCodeError < StandardError
  def message
    "Currency types are not consistent, cannot be added or subtracted."
  end
end
