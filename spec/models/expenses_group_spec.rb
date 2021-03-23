require 'rails_helper'

RSpec.describe ExpensesGroup, type: :model do
  before(:example) do
    @user = User.create(name: 'test_user')
    @group = Group.create(name: 'haha', user_id: @user.id)
    @expense = Expense.create(name: 'haha', amount: 500, author_id: @user.id)
  end

  it "doesn't validate if group doesn't exist" do
    pgroup = ExpensesGroup.new(group_id: 1000, expense_id: @expense.id)
    expect(pgroup.valid?).to be false
  end

  it "doesn't validate if expense doesn't exist" do
    pgroup = ExpensesGroup.new(expense_id: 1000, group_id: @group.id)
    expect(pgroup.valid?).to be false
  end

  it 'validates with valid info' do
    pgroup = ExpensesGroup.new(expense_id: @expense.id, group_id: @group.id)
    expect(pgroup.valid?).to be true
  end
end
