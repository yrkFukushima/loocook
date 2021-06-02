class Dish < ApplicationRecord
  belongs_to :user

  validates :dish_1, presence: true

  def start_time
    self.updated_at
  end

  def self.search(search)
    if search != ""
      Dish.where('text LIKE(?)',"%#{search}%")
    else
    Dish.all
    end
  end 
end
