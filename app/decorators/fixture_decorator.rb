class FixtureDecorator < Draper::Decorator
  delegate_all

  def purchase_value_to_currency
  	h.number_to_currency purchase_value
  end

end
