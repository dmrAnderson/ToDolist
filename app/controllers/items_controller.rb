# frozen_string_literal: true

# RESTful for Items
class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_items, except: [:create, :update]

  def create
    if List.find(params[:list_id]).items.build(item_params).save
      back_with_flash("Created")
    else
      back_with_flash("Look at form")
    end
  end

  def update
    if List.find(params[:list_id]).items.find(params[:id]).update(item_params) # FIX
      redirect_to list_path(params[:list_id]), light: "Updated"
    else
      redirect_to list_path(params[:list_id]), light: "Wrong"
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
    @item = List.find(params[:id]).items.find(params[:list_id]) # id go back and forth
  end
end
