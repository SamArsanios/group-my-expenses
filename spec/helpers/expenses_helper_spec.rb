require 'rails_helper'

RSpec.describe ExpensesHelper, type: :helper do
  describe 'total expenses' do
    before(:example) do
      user = User.create(name: 'test_user')
      5.times do |i|
        Expense.create(name: "test_expense_#{i}", amount: i, author_id: user.id)
      end
      @expenses = Expense.all
    end
    it 'gives sum of all expenses' do
      expect(total_expenses(@expenses)).to eq 10
    end
  end
end
