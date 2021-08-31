class OrdersController < ApplicationController
    ORDER_PER_PAGE = 5
    
    def index
        @orders = Order.all 
        @page = params.fetch(:page, 0).to_i
        @orders = Order.offset(@page*ORDER_PER_PAGE).limit(ORDER_PER_PAGE)
    end

    def create
        @order = Order.new()
        @order.user_id = current_user.id
        @order.save
        order_items = current_user.cart.cart_items
        order_items.each do |order_item|
            @order_item = OrderItem.new()
            @order_item.product_id = order_item.product_id
            @order_item.order_id = @order.id
            @order_item.total_price = order_item.total
            @order_item.save    
            current_user.cart.cart_items.destroy_all
        end
            redirect_to root_path, notice: 'Your Order successfully Placed!.'
            PostMailer.order_placed_email(current_user).deliver 
    end
end
    
