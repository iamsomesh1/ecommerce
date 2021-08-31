class CartsController < ApplicationController

  def add_to_cart
    product = Product.find(params[:product_id])
    cart = current_user.cart
    cart_items = cart.cart_items
    item = cart_items.find_by(product_id: product.id)
    if  item
      item.quantity += 1
      item.total = item.quantity * product.price
      item.save
    else
      cart_items.create(product_id: product.id, quantity: 1, total: product.price)    
    end
    cart.update(total_price: cart_items.pluck(:total).reduce(:+))
    redirect_to root_path
  end

  def remove_from_cart
    cart = current_user.cart
    cart_items = cart.cart_items
    item  = cart_items.find_by(id: params[:item_id])
    if item && item.quantity > 1
      item.quantity -= 1
      item.total = item.quantity * item.product.price
      item.save
    elsif item && item.quantity == 1
      item.destroy
    end
    cart.update(total_price: cart_items.pluck(:total).reduce(:+))
    redirect_to root_path
  end
end
 