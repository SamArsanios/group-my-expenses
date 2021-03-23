module ExpensesHelper
  def total_expenses(expenses)
    expenses.inject(0) { |accum, expense| accum + expense.amount }
  end
end
