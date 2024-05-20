class OrdersController < ApplicationController
  def index
    @order = Order.new
    @purchase = Purchase.new
  end

  def create
    purchase = Purchase.new
    purchase.user_id = current_user.id
    purchase.item_id = 1
    purchase.save

    @order = Order.create(order_params)

    if @order.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:postcode, :regiondelivery_id, :municipalities, :blocknumber, :buildingname, :telnumber).merge(purchase_id: purchase.id)
  end

end