class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :find_params, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.order('created_at DESC')
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
    redirect_to action: :index if current_user.id != @item.user_id || @item.purchase.present?
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy

    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  

  private

  def item_params
    params.require(:item).permit(:image, :content, :item_name, :category_id, :item_status_id, :ship_fee_id, :prefecture_id, :schedule_id,
                                 :price).merge(user_id: current_user.id)
  end

  def find_params
    @item = Item.find(params[:id])
  end
end
