class NaN < StandardError
  def message
    "This is not a number."
  end
end
