class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :dish_1,    null:false
      t.string :dish_2
      t.string :dish_3
      t.string :dish_4
      t.string :dish_5
      t.references :user, foreign_key:true
      t.timestamps
    end
  end
end
