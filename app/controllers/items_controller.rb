class ItemsController < ApplicationController
  # 商品一覧表示
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]



  def index
    @items = Item.order("created_at DESC")
  end

  # 商品出品
  def new
    @item = Item.new
  end

  

  # 商品個別表示
  def show
  end

  # 商品保存
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    if @item.purchase
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :price, :description, :category_id, :condition_id, :costdelivery_id, :regiondelivery_id, :datedelivery_id).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def correct_user
    unless current_user == @item.user
      redirect_to root_path
    end
  end
end
