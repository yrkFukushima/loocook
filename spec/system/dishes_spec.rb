require 'rails_helper'

RSpec.describe "新規記録", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @dish_1 = Faker::Lorem.sentence
    @dish_2 = Faker::Lorem.sentence
    @dish_3 = Faker::Lorem.sentence
    @dish_4 = Faker::Lorem.sentence
    @dish_5 = Faker::Lorem.sentence
  end

  context '記録ができるとき'do
    it 'ログインしたユーザーは新規の記録ができる' do
      # ログインする
        sign_in(@user)
      # 記録するボタンがあることを確認する
      expect(page).to have_content('記録する')
      # 記録ページに遷移する
        visit new_dish_path
      # フォームに情報を入力する
        fill_in 'dish_dish_1', with:@dish_1
        fill_in 'dish_dish_2', with:@dish_2
        fill_in 'dish_dish_3', with:@dish_3
        fill_in 'dish_dish_4', with:@dish_4
        fill_in 'dish_dish_5', with:@dish_5
      # 送信するとDishモデルのカウントが上がることを確認する
        expect{
          find('input[name="commit"]').click
        }.to change {Dish.count}
      # トップページに移動する
        expect(current_path).to eq(root_path)
      # トップページには先程の記録が表示されていること確認する
        expect(page).to have_content(@dish_1)
        expect(page).to have_content(@dish_2)
        expect(page).to have_content(@dish_3)
        expect(page).to have_content(@dish_4)
        expect(page).to have_content(@dish_5)
    end
  end
  context '記録ができないとき'do
    it 'ログインししていないと新規の記録作成ページに遷移できない' do
      # トップページに遷移する
        visit root_path
      # 記録するボタンがあることを確認する
      expect(page).to have_content('記録する')
      # 記録ページに遷移する
        visit new_dish_path
      # ログインページに遷移していることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

RSpec.describe "ユーザーページ", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @dish_1 = Faker::Lorem.sentence
    @dish_2 = Faker::Lorem.sentence
    @dish_3 = Faker::Lorem.sentence
    @dish_4 = Faker::Lorem.sentence
    @dish_5 = Faker::Lorem.sentence
  end
  it 'ログインしていると記録詳細を閲覧できる'do
    # ログインする
    sign_in(@user)
    # 記録する
    visit new_dish_path
    fill_in 'dish_dish_1', with:@dish_1
    fill_in 'dish_dish_2', with:@dish_2
    fill_in 'dish_dish_3', with:@dish_3
    fill_in 'dish_dish_4', with:@dish_4
    fill_in 'dish_dish_5', with:@dish_5
    expect{
      find('input[name="commit"]').click
    }.to change {Dish.count}
    expect(current_path).to eq(root_path)
    # ユーザーページに遷移する
    visit user_path(@user)
    # ユーザーページに記録の内容が含まれている
    expect(page).to have_content(@dish_1)
    expect(page).to have_content(@dish_2)
    expect(page).to have_content(@dish_3)
    expect(page).to have_content(@dish_4)
    expect(page).to have_content(@dish_5)
  end
  it 'ログインしていないとユーザーの記録詳細を閲覧できない'do
    #記録する
    sign_in(@user)
    visit new_dish_path
    fill_in 'dish_dish_1', with:@dish_1
    fill_in 'dish_dish_2', with:@dish_2
    fill_in 'dish_dish_3', with:@dish_3
    fill_in 'dish_dish_4', with:@dish_4
    fill_in 'dish_dish_5', with:@dish_5
    expect{
      find('input[name="commit"]').click
    }.to change {Dish.count}
    expect(current_path).to eq(root_path)
    #ログアウトする
    find('a[name="logout"]').click
    # トップページに遷移する
      visit root_path
    # ユーザーページに遷移する
    visit user_path(@user)
    # ログインページに遷移していることを確認する
    expect(current_path).to eq(new_user_session_path)
  end
end  