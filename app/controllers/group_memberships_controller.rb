class GroupMembershipsController < ApplicationController

  def new
    @group_member = GroupMembership.new
  end

  def index
    @group_members = GroupMembership.all 
  end

  def create
    @group_member = current_user.group_memberships.build(reg_params)
    group_name = params["group_membership"]["group"]    
    password = params["group_membership"]["password"]
    @group ||= Group.where(name: group_name, password: password).first
    if !@group.nil?
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
  def reg_params
    params.require(:group_membership).permit(:group_id, :user_id) 
  end

end
