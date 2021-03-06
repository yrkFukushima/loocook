class DishesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def index
    @dishes= Dish.all.order("created_at DESC")
  end

  def new
    @dish= Dish.new
  end  
  def create
  @dish = Dish.new(dish_params)
    if @dish.save
      redirect_to root_path
    else  
      render :new
    end  
  end  

  def show
    @dishes= Dish.all
  end  

  def about
  end  

  def search
    @dishes= Dish.search(params[:keyword])
  end  

  private

  def dish_params
    params.require(:dish).permit(:dish_1, :dish_2, :dish_3, :dish_4, :dish_5).merge(user_id: current_user.id)
  end 
  
  
end
