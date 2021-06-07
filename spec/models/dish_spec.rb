require 'rails_helper'

RSpec.describe Dish, type: :model do
  before do 
    @dish = FactoryBot.build(:dish)
  end
  
  describe '料理の記録' do
    context '料理の記録ができる場合' do
      it '全ての項目が正しく入力されていれば登録できる' do
        expect(@dish).to be_valid
      end  
    end
    context '料理の記録ができない場合' do
      it 'dish_1が空だと登録できない' do
        @dish.dish_1 =''
        @dish.valid?
        expect(@dish.errors.full_messages).to include("Dish 1を入力してください")
      end
      it 'user情報が存在しないと登録できない' do
        @dish.user = nil
        @dish.valid?
        expect(@dish.errors.full_messages).to include("Userを入力してください")
      end  
    end
  end  
  
end
