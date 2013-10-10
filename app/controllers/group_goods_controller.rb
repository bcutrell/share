class GroupGoodsController < GoodsController
  before_filter :set_group

  protected
  def build_good
    @good = @group.goods.build(reg_params)
    @good.private = true
    @good.user = current_user
  end

  def set_group
   @group = Group.find(params[:group_id])
  end

end
