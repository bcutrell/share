class GroupMembershipsController < ApplicationController

  def new
    @group_member = GroupMembership.new
  end

  def index
    @group_members = GroupMembership.all 
  end

  def create
    @group_member = current_user.group_memberships.build(reg_params)
    # binding.pry 

    if @group_member.save
      flash[:notice] = "Welcome To The Group!"
      redirect_to home_dashboard_path
    else
      render :new
    end

    # Group.where(password: "password").present?
    # Group.where(name: "name").present?
  end

  protected
  def reg_params
    params.require(:group_membership).permit(:group_id, :user_id) 
  end

end
