class MenuController < ApplicationController
  load_and_authorize_resource :order
  
  before_filter :require_user
    
  def show
    @items = Item.all
    @order = current_user.cart    
  end

  def create
    @item = Item.find(params[:id])
    current_user.cart.add_item @item
    respond_to do |format|
      format.html {redirect_to :action => :show}
      format.js
    end
  end

  def destroy
    @item = Item.find(params[:id])
    current_user.cart.remove_item @item 
    respond_to do |format|
      format.html {redirect_to :action => :show}
      format.js
    end
  end
  
  private
end
