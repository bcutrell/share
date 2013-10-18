class HomeController < ApplicationController

  def index
  end

  def signup
  end

  def house
    @rooms = Category.includes(:goods)
  end

  def map
  end
end
