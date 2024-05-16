class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
  end

  def new
    @item = Item.new
  end

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
    params.require(:item).permit(:image, :name, :price, :description, :category_id, :condition_id, :costdelivery_id, :regiondelivery_id, :datedelivery_id).merge(user_id: current_user.id)
    # models/item.rb  has_one_attached :image
  end
end
