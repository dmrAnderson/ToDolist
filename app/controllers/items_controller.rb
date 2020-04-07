# frozen_string_literal: true

# RESTful for Items
class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_items, except: %i[index create]

  def index
    @item = current_user.items.build
    @items = current_user.items.order(created_at: :desc)
  end

  def edit; end

  def create
    if (@item = current_user.items.build(item_params)).save
      back_with_flash("Created")
    else
      back_with_flash("Look at form")
    end
  end

  def update
    if @item.update(item_params)
      back_with_flash("Updated")
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    back_with_flash("Deleted")
  end

  def completed
    if params[:item][:completed] == "1" && !@item.completed?
      @item.update_columns(completed: true)
      back_with_flash("Completed")
    elsif params[:item][:completed] == "0" && @item.completed?
      @item.update_columns(completed: false)
      back_with_flash("Uncompleted")
    else
      back_with_flash("Check the box")
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
