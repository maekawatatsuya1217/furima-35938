class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:show, :edit]
  before_action :unless, only: [:edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to items_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :status_id, :shipping_change_id, :area_id, :days_to_ship_id, :image, :name,
                                 :description, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def unless
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
