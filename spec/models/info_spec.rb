# % bundle exec rspec spec/models/info_spec.rb

require 'rails_helper'

RSpec.describe Info, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @info = FactoryBot.build(:info)
  end

  describe 'お知らせ登録' do
    context 'お知らせ登録ができるとき' do
      it '全て正しく入力されると、登録できる' do
        expect(@info).to be_valid
      end
    end

    context '新規登録ができないとき' do
      it 'お知らせタイトルが空では登録できない' do
        @info.title = nil
        @info.valid?
        expect(@info.errors.full_messages).to include("Title can't be blank")
      end

      it 'お知らせ内容が空では登録できない' do
        @info.text = nil
        @info.valid?
        expect(@info.errors.full_messages).to include("Text can't be blank")
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @info.user = nil
        @info.valid?
        expect(@info.errors.full_messages).to include('User must exist')
      end
    end
  end
end
