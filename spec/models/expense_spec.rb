require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:example) do
    @user = User.create(name: 'user1')
    @amount = 50
  end

  it "doesn't validate expense with name length < 3" do
    expense = Expense.new(name: 'ha', amount: @amount, author_id: @user.id)
    expect(expense.valid?).to be false
  end

  it "doesn't validate expense if user doesn't exist" do
    expense = Expense.new(name: 'be', amount: @amount, author_id: 56)
    expect(expense.valid?).to be false
  end

  it "doesn't validate expense if amount is not a number" do
    expense = Expense.new(name: 'wired', amount: 'money', author_id: 9)
    expect(expense.valid?).to be false
  end

  it 'validates expense with name which meets the validation criteria' do
    expense = Expense.new(name: 'beard', amount: @amount, author_id: @user.id)
    expect(expense.valid?).to be true
  end
end
