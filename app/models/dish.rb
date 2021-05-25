class Dish < ApplicationRecord
  belongs_to :user

  validates :dish_1, presence: true

  def start_time
    self.updated_at
  end
end
