class CartsController < ApplicationController

  def show
    @current_cart = current_user.current_cart
  end

  def checkout
    @cart = current_user.current_cart
    @cart.inventory_adjustment
    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path
  end

end

