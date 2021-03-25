class ExpensesController < ApplicationController
  before_action :logged_in_or_back

  def new
    @expense = Expense.new
  end

  def index
    @expenses = Expense.includes(groups: [icon_attachment: :blob]).paginate(page: params[:page], per_page: 3)
      .where('author_id=?', current_user.id).joins(:groups).order(:created_at)
  end

  def index_no_group
    @expenses = Expense.includes(groups: [icon_attachment: :blob]).paginate(page: params[:page], per_page: 3)
      .where('author_id=?', current_user.id).left_outer_joins(:groups).where('groups.id IS NULL')
    render 'index'
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.author_id = current_user.id
    ids = params[:expense][:group].reject { |c| c.empty? }
    groups = Group.find(ids)
    @expense.groups << groups
    if @expense.save
      flash[:success] = ['Expense Added']
      redirect_to expenses_path
    else
      flash[:danger] = expense.errors.full_messages
      redirect_back(fallback_location: new_expense_path)
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
