# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_list, except: %i[index new create]

  def index
    @lists = current_user.lists
  end

  def show
    @items = @list.items.order(created_at: :desc)
  end

  def new
    @list = current_user.lists.build
  end

  def edit; end

  def create
    if (@list = current_user.lists.build(list_params)).save
      redirect_to @list, ligth: 'Created'
    else
      render :new
    end
  end

  def update
    if @list.update(list_params)
      redirect_to :root, ligth: 'Updated'
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to :root, ligth: 'Deleted'
  end

  private

  def find_list
    @list = current_user.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
