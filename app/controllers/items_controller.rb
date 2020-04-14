# frozen_string_literal: true

# comment
class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_list
  before_action :find_item, except: :create

  def create
    msg = if @list.items.build(item_params).save
            'Created'
          else
            'Look at form'
          end
    redirect_to @list, light: msg
  end

  def update
    if params[:commit].present?
      msg = @item.update(item_params) ? 'Updated' : 'Wrong'
    else
      msg = @item.completed ? 'Unompleted' : 'Completed'
      @item.done_or_undone
    end
    redirect_to @list, light: msg
  end

  def destroy
    @item.destroy
    redirect_to @list, light: 'Deleted'
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end

  def find_item
    @item = @list.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:description)
  end
end
