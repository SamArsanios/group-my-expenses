class GroupsController < ApplicationController
  before_action :logged_in_or_back

  def new
    @group = Group.new
  end

  def index
    @groups = Group.includes(:user).paginate(page: params[:page], per_page: 3).order(:name).with_attached_icon
  end

  def create
    group = Group.new(group_params)
    group.user_id = current_user.id

    if group.save
      flash[:success] = ['Group has been Added!']
      redirect_to groups_path
    else
      flash[:danger] = group.errors.full_messages
      redirect_back(fallback_location: new_group_path)
    end
  end

  def show
    @group = Group.includes(:expenses, :user).find(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
