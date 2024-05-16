class ItemsController < ApplicationController
  # 商品一覧表示
  def index
    @items = Item.order("created_at DESC")
  end

  # 商品出品
  def new
    @item = Item.new
  end

  # 商品個別表示
  def show
    @item = Item.find(params[:id])
  end

  # 商品保存
  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :description, :category_id, :condition_id, :costdelivery_id, :regiondelivery_id, :datedelivery_id).merge(user_id :current_user.id)
    # models/item.rb  has_one_attached :image
  end
end
