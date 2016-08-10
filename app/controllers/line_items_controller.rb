class LineItemsController < ApplicationController


  def create

    @item = Item.find(params[:item_id])
    @user = current_user
    @cart = @user.current_cart

      if @cart.nil?
        @cart = Cart.new
        @cart.user = @user
        @cart.save
        @user.current_cart = @cart
        @user.save
        new_item = @cart.add_item(@item.id)
        new_item.save
        redirect_to @cart
      else
        new_item = @cart.add_item(@item.id)
        redirect_to @cart
      end
  end

end
