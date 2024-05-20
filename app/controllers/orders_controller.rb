class OrdersController < ApplicationController
  before_action :authenticate_user!
  def create
    @item = Item.find(params[:item_id])
    @order = Order.create(order_params)
    @purchase = Purchase.new(
      user_id: current_user.id,
      item_id: @item.id,
      order_id: @order.id
    )
    @purchase.save

    if @order.valid?
      pay_item
      @order.save
      # sold prameter更新
      item=Item.find(params[:item_id])
      item.sold=true
      item.save

      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :new, status: :unprocessable_entity
    end
  end

  def new
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @order = Order.new
    @purchase = Purchase.new
  end

  private

  def order_params
    params.require(:order).permit(:postcode, :regiondelivery_id, :municipalities, :blocknumber, :buildingname, :telnumber).merge(item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end