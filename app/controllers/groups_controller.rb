class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def index
    @groups = Group.member_of(current_user)
  end

  def create
    @group = Group.new(group_params)
    @group.users << current_user
    if @group.save
      flash[:notice] = "Group Created"
      redirect_to home_dashboard_path
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  protected
  def group_params
    params.require(:group).permit(:name, :password, :password_confirmation)
  end

end
