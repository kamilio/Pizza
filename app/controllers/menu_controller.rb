class MenuController < ApplicationController
  before_filter :require_user
    
  def show
    @items = Item.all
    @order = current_user.cart    
  end

  def add
    @item = Item.find(params[:item_id])
    current_user.cart.add_item @item
    respond_to do |format|
      format.html {redirect_to :action => :show}
      format.js
    end
  end

  def remove
    @item = Item.find(params[:item_id])
    current_user.cart.remove_item @item 
    respond_to do |format|
      format.html {redirect_to :action => :show}
      format.js
    end
  end
  
  private
end
