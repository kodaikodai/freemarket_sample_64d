class ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
    @image = Image.includes(:item)
    # binding.pry
  end
end
