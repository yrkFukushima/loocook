class Dish < ApplicationRecord
  belongs_to :user

  validates :dish_1, presence: true

  def start_time
    self.updated_at
  end

  def self.search(search)
    if search != ""
      Dish.where(['dish_1 LIKE(?) OR dish_2 LIKE(?) OR dish_3 LIKE(?) OR dish_4 LIKE(?) OR dish_5 LIKE(?)',"%#{search}%" ,"%#{search}%","%#{search}%","%#{search}%","%#{search}%"])
    else
    Dish.all
    end
  end 
end
