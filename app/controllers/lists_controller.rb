class ListsController < ApplicationController
   before_action :authenticate_user! # users must be signed in before any lists_controller method

  def show
    @list = current_user.list
    if @list 
        @current_items_in_the_list = @list.items
        @item = Item.new
    end
     
  end


  def new   
    @list = List.new 
  end

  def create
    if current_user.list
      flash[:notice] = "You already have one list, bitch!"
       redirect_to current_user.list
      return   false
    end
     @list = List.new(params.require(:list).permit(:title))
     @list.user = current_user
     if @list.save
       flash[:notice] = "Created list!"
       redirect_to @list
     else
       flash[:error] = "You and your list suck - try again"
       render :new
     end
  end

  def edit
    @list = current_user.list
  end

  def update
     @list = current_user.list
     if @list.update_attributes(params.require(:list).permit(:title))
       flash[:notice] = "List title was updated."
       redirect_to @list
     else
       flash[:error] = "You and your list suck - try again"
       render :edit
     end
   end

  def destroy
     @list = List.first

     if @list.destroy
       flash[:notice] = "The list was succesfully deleted"
       redirect_to list_path
     else
       flash[:error] = "There was an error deleting the topic."
       render list_path
     end
   end
end