class HomeController < ApplicationController
  def home
    
  end
  def menu
    @items = Item.all
  end
end
