class ItemsController < ApplicationController
   before_action :authenticate_user! # users must be signed in before any lists_controller method

  def create
    
    @item = Item.new(params.require(:item).permit(:name))
    @item.list = current_user.list
     if @item.save
       flash[:notice] = "You're item was added to the list!"
       redirect_to @item.list
     else
       flash[:error] = "You and your Item suck - try again"
       render @item.list
     end
  end
end