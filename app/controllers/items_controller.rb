# frozen_string_literal: true

# RESTful for Items
class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_items, except: %i[index create]

  def index
    @create_item = current_user.items.build
    @items = current_user.items.order(created_at: :desc)
  end

  def show; end

  def edit; end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to :root, light: 'Task created'
    else
      render 'new'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to :root, light: 'Task updated'
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to :root, light: 'Task deleted'
  end

  def completed
    if params[:item][:completed] == '1' && !@item.completed?
      @item.update_columns(completed: true, completed_at: Time.now)
      redirect_to :root, light: 'Completed'
    elsif params[:item][:completed] == '0' && @item.completed?
      @item.update_columns(completed: false, completed_at: nil)
      redirect_to :root, light: 'Uncompleted'
    else
      redirect_to :root, light: 'Check the box'
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description)
  end

  def find_items
    @item = current_user.items.find(params[:id])
  end
end
