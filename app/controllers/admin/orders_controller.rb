class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
    @selected_status = @order.status
    @order_detail = @order.order_details
  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.status = params[:status]
    @order.update(order_params)
      if @order.status == "confirmation"
        @order_details.update_all(making_status: "mati")
      end
      redirect_to request.referer
  end
  
  private
  def order_params
    params.require(:order).permit(:status)
  end
  
end
