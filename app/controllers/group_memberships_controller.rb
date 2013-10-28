class GroupMembershipsController < ApplicationController

  def new
    @group_member = GroupMembership.new
  end

  def index
    @group_members = GroupMembership.all
  end

  def create
    @group_member = current_user.group_memberships.build(group_membership_params)
    @group = Group.find_by_name(params["group_membership"]["group"])
    if @group && @group.authenticate(params["group_membership"]["password"])
      @group_member.group = @group
      @group_member.save
      flash[:notice] = "Welcome To The Group!"
      redirect_to home_dashboard_path
    else
      flash[:notice] = "Incorrect Password, try again"
      render :new
    end
  end

  protected
  def group_membership_params
    params.require(:group_membership).permit(:group_id, :user_id)
  end

end
