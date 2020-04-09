# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_list
  before_action :find_item, except: [:create]

  def create
    msg = if @list.items.build(item_params).save
            'Created'
          else
            'Look at form'
          end
    redirect_to @list, light: msg
  end

  def update
    msg = if @item.update(item_params)
            'Updated'
          else
            'Wrong'
          end
    redirect_to @list, light: msg
  end

  def destroy
    @item.destroy
    redirect_to @list, light: 'Deleted'
  end

  def completed
    if params[:item][:completed] == '1' && !@item.completed?
      @item.done_or_undone
      msg = 'Completed'
    elsif params[:item][:completed] == '0' && @item.completed?
      @item.done_or_undone
      msg = 'Uncompleted'
    else
      msg = 'Check the box'
    end
    redirect_to @list, light: msg
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end

  def find_item
    @item = @list.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description)
  end
end
