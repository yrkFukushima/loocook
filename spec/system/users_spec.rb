require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context "ユーザー新規登録ができる時" do
    it "正しい情報を入力すれば新規登録ができトップページに遷移する" do
      # トップページに移動する
        visit root_path
      # トップページにサインアップページに移動するボタンがある
        expect(page).to have_content('新規登録')
      # 新規登録ページに移動する
        visit new_user_registration_path
      # ユーザー情報を入力する
        fill_in 'user_nickname', with:@user.nickname
        fill_in 'user_email', with:@user.email
        fill_in 'user_password' ,with: @user.password
        fill_in 'user_password_confirmation', with:@user.password_confirmation     
      # サインアップボタンを押すとユーザーのモデルのカウントが1上がることを確認する
        expect{
          find('input[name="commit"]').click
        }.to change{User. count}.by(1)
      # トップページに遷移したことを確認する
        expect(current_path).to eq(root_path)
      # ログアウトボタンが表示されていることを確認する
        expect(page).to have_content('ログアウト')
      # サインアップページに遷移するボタンやログインページに遷移するボタンが表示されていないことを確認する
        expect(page).to have_no_content('新規登録')
        expect(page).to have_no_content('ログイン')
    end
  end
  context "ユーザー新規登録ができない時" do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページに戻ってきくる' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページに遷移するボタンがある
      expect(page).to have_content('新規登録')
      # 新規登録ページに移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
        fill_in 'user_nickname', with:''
        fill_in 'user_email', with:''
        fill_in 'user_password' ,with:''
        fill_in 'user_password_confirmation', with:''   
      # サインアップボタンを押してもモデルのカウントが変化しないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change{User. count}.by(0)
      # 新規登録ページに戻されることを確認する
      expect(current_path).to eq(user_registration_path)
    end
  end
  
end

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができる時' do
    it '保存されているユーザーの情報と合致すればログインできる' do
      # トップページに移移動する
        visit root_path
      # トップページにログインページに遷移するボタンがあることを確認する
        expect(page).to have_content('ログイン')
      # ログインページに遷移する
        visit new_user_session_path
      # 正しいユーザー情報を入力する
        fill_in 'user_email', with:@user.email
        fill_in 'user_password', with:@user.password
      # ログインボタンを押す
        find('input[name="commit"]').click
      # トップページへ遷移することを確認する
        expect(current_path).to eq(root_path)
      # ログアウトボタンが存在することを確認する
        expect(page).to have_content('ログアウト')
      # サインアップページやログインページに遷移するボタンがないことを確認する
        expect(page).to have_no_content('新規登録')
        expect(page).to have_no_content('ログイン')
    end
  end  
  context 'ログインができない時'do
    it ' 保存されているユーザーの情報と合致しない場合はログインできない' do
      # トップページに移動する
        visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
        expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
        fill_in 'user_email', with:''
        fill_in 'user_password', with:''
      # ログインボタンを押す
        find('input[name="commit"]').click
      # ログインページに戻されることを確認する
        expect(current_path).to eq(new_user_session_path)

    end
  end
end

