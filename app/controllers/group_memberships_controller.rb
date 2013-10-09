class GroupMembershipsController < ApplicationController

  def new
    @group_member = GroupMembership.new
  end

  def index
    @group_members = GroupMembership.all 
  end

  def create
    @group_member = current_user.group_memberships.build(reg_params)
    # group_id = params["group_membership"]["group_id"]
    group_name = params["group_membership"]["group"]
    # @group = Group.where(name: group_name).first
    password = params["group_membership"]["password"]
    binding.pry
    if Group.where(name: group_name, password: password).present?
      @group_member.save
      flash[:notice] = "Welcome To The Group!"
      redirect_to home_dashboard_path
    else
      flash[:notice] = "Incorrect Password, try again"
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
