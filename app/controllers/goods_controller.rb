class GoodsController < ApplicationController

  def new
    @good = Good.new
  end

  def index
    @goods = Good.all
  end

  def create
    build_good
    @good.user = current_user 
    if @good.save
      flash[:notice] = "Thanks for sharing"
      redirect_to home_dashboard_path
    else
      render :new
    end
  end

  def show
    @good = Good.find(params[:id])
  end

  protected
  def reg_params
    params.require(:good).permit(:title, :description, :location, :image, :user_id, category_ids: [])
  end

  def build_good
    @good = Good.new(reg_params)
  end
end
