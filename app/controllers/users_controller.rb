class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @users = User.includes(:dishes)
    @user = User.find(params[:id])
    @dishes = @user.dishes

  end  
end
