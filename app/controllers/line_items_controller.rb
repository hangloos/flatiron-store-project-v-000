class LineItemsController < ApplicationController


  def create

    current_user.create_current_cart unless current_user.current_cart
    line_item = current_user.current_cart.add_item(params[:item_id])
    if line_item.save
      redirect_to cart_path(current_user.current_cart), {notice: 'Item added to cart!'}
    else
      redirect_to store_path, {notice: 'Unable to add item'}
    end


 #   @item = Item.find(params[:item_id])
  #  @user = current_user
   #   if @user.current_cart.nil?
    #    @cart = Cart.new
     #   @cart.user = @user
      #  @cart.save
       # @user.current_cart = @cart
    #    new_item = @cart.add_item(@item.id)
     #   new_item.save
      #  redirect_to @cart
   #   else
    #    @cart = current_user.current_cart
     #   new_item = @cart.add_item(@item.id)
      #  redirect_to @cart
      #end
  end

end
