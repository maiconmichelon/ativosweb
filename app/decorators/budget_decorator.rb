class BudgetDecorator < Draper::Decorator
  delegate_all

  def format
  	currency_date = l(date)
  	currency_value = h.number_to_currency(value)
  	"#{currency_date} - #{provider.name} - #{currency_value} - #{observation}"
  end

end
