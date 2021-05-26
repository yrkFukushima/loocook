class UsersController < ApplicationController

  def show
    @users = User.includes(:dishes)
    @user = User.find(params[:id])
    @dishes = @user.dishes

  end  
end
