class CartsController < ApplicationController

  def show
    @current_cart = current_user.current_cart
  end

  def checkout
    @cart = current_user.current_cart
    @cart.status = "submitted"
    @cart.inventory_adjustment
    current_user.remove_cart
    redirect_to cart_path(@cart)
  end

end

