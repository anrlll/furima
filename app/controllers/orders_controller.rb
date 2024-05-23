class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_item, only: [:new, :create]
  before_action :correct_user, only: [:new, :create]

  def create
    @userorder = Userorder.new(userorder_params)
    if @userorder.valid?
      pay_item
      @userorder.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :new, status: :unprocessable_entity
    end
  end

  def new
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @userorder = Userorder.new
  end

  private

  def userorder_params
    params.require(:userorder).permit(:postcode, :regiondelivery_id, :municipalities, :blocknumber, :buildingname, :telnumber).merge(user_id: current_user.id,item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: userorder_params[:token],
      currency: 'jpy'
    )
  end

  def correct_item
    @item = find_item
    if @item.purchase
      redirect_to root_path
    end
  end

  def correct_user
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
end

