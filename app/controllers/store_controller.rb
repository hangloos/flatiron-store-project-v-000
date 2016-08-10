class StoreController < ApplicationController
  

  def index
    if current_user
    @categories = Category.all
    @items = Item.all
    @cart = current_user.current_cart
    else
      @categories = Category.all
      @items = Item.all 
    end 
  end
end
