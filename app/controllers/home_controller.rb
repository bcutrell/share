class HomeController < ApplicationController

  def index
  end

  def signup
  end

  def house
    @rooms = Category.includes(:goods)
  end

  def map
    @good = Good.all.first
    @goods = Good.all
  end
end
