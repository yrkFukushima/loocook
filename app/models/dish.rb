class Dish < ApplicationRecord
  belongs_to :user

  validates :dish_1, presence: ture
end
