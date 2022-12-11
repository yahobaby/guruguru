# % bundle exec rspec spec/models/comment_spec.rb 

require 'rails_helper'

RSpec.describe Comment, type: :model do
    before do
      @user = FactoryBot.build(:user)
     @info  = FactoryBot.build(:info)
     @comment = FactoryBot.build(:comment)
   end

   describe 'コメント投稿機能' do 
   context '内容に問題ない場合' do
      it "内容に問題ない場合コメント保存できる" do
        expect(@comment).to be_valid
     end
    end

   context '内容に問題がある場合' do
      it 'ユーザーが紐付いていなければコメント投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
    end

    it 'お知らせが紐付いていなければコメント投稿できない' do
       @comment.info = nil
       @comment.valid?
       expect(@comment.errors.full_messages).to include('Info must exist')
      end
    end
  end
end
