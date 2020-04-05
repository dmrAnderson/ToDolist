# frozen_string_literal: true

# RESTful for Items
class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_items, except: %i[index new create]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def show; end

  def new
    @item = Item.new
  end

  def edit; end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to :root, notice: 'Item created'
    else
      render 'new'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to :root, notice: 'Item updated'
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to :root, notice: 'Item deleted'
  end

  private

  def item_params
    params.require(:item).permit(:title, :description)
  end

  def find_items
    @item = Item.find(params[:id])
  end
end
