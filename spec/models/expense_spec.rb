require 'rails_helper'

RSpec.describe Expense, type: :model do
    before(:example) do
      @user = User.create(name: 'test_user')
      @amount = 50
    end
  
    it "doesn't validate payment with short name" do
      expense = Expense.new(name: 'ha', amount: @amount, author_id: @user.id)
      expect(expense.valid?).to be false
    end
  
    it "doesn't validate payment if user doesn't exist" do
      expense = Expense.new(name: 'ha', amount: @amount, author_id: 9)
      expect(expense.valid?).to be false
    end
  
    it "doesn't validate payment if amount is not a number" do
      expense = Expense.new(name: 'haha', amount: 'ha', author_id: 9)
      expect(expense.valid?).to be false
    end
  
    it 'validates payment with name with proper attrs' do
      expense = Expense.new(name: 'haha', amount: @amount, author_id: @user.id)
      expect(expense.valid?).to be true
    end
end
