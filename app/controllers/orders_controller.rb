class OrdersController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @order = Order.create(order_params)
    @purchase = Purchase.new(
      user_id: current_user.id,
      item_id: @item.id,
      order_id: @order.id
    )
    @purchase.save

    if @order.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @item = Item.find(params[:item_id])
    @order = Order.new
    @purchase = Purchase.new
  end

  private

  def order_params
    params.require(:order).permit(:postcode, :regiondelivery_id, :municipalities, :blocknumber, :buildingname, :telnumber).merge(item_id: @item.id)
  end

end