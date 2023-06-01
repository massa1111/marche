class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :edit, :show, :destroy]
  before_action :authenticate_user!, except: [:item_list,:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  def item_list
    @items = Item.includes(:user).order('created_at DESC')
    render 'items/item_list'
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
    @user = @item.user
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id,
                                 :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def order_exists?
    Order.exists?(item_id: @item.id)
  end

  def contributor_confirmation
    redirect_to root_path if current_user != @item.user || order_exists?
  end
end
