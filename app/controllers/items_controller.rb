class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :unless, only: [:edit, :update, :destroy]
  before_action :search_item, only: [:index, :search]

  def index
    @items = Item.all.order('created_at DESC')
    set_item_column
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
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
    if @item.update(item_params)
      redirect_to items_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to items_path
    else
      render :index
    end
  end

  def search
    @results = @p.result.includes(:category_id)
    @q = Item.ransack(params[:q])
    @items = @q.result
    set_item_column
  end

  def research
    @tweets = Tweet.search(params[:keyword])
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
    redirect_to root_path if @item.history.present? || current_user.id != @item.user_id
  end

  def search_item
    @p = Item.ransack(params[:q])
  end

  def set_item_column
    @item_name = Item.select("name").distinct
  end
end
