class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)
    if @order_details.all? { |detail| detail.making_status == "complete" } #全てのorderdetailのmaking_statusが制作完了の時
      @order.update(status: "preparing")                                   #orderのstatusを発送準備中に更新
    end
    if @order_detail.making_status == "making" #orderdetailのmaking_statusが製作中の時
      @order.update(status: "creationg")          #orderのstatusを製作中に更新
    end
    redirect_to request.referer
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
