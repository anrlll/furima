require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    # @user = FactoryBot.build(:user)
    @user = User.new(nickname: "testuser", email: "testtest@example.com", password: "test1111", password_confirmation: "test1111", date_birth: "2000/10/11", last_name: "山田", first_name: "太郎", last_name_kana: "ヤマダ", first_name_kana: "タロウ")
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合 ' do
      it 'すべての要素が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複している場合は登録できない' do
        @user.save
        @another_user = User.new(nickname: "user", email: "testtest@example.com", password: "test1111", password_confirmation: "test1111", date_birth: "2000/10/10", last_name: "山", first_name: "太", last_name_kana: "ヤマ", first_name_kana: "タ")
        @another_user.valid?
        expect(@another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'test1111'
        @user.password_confirmation = 'testtest1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが6文字未満だと登録できない' do
        @user.password = 'test1'
        @user.password_confirmation = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが英字のみだと登録できない' do
        @user.password = 'testtest'
        @user.password_confirmation = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("last_name can't be blank")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("first_name can't be blank")
      end
      it 'last_nameが全角以外（漢字・ひらがな・カタカナ）だと登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'first_nameが全角以外（漢字・ひらがな・カタカナ）だと登録できない' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("last_name_kana can't be blank")
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("first_name_kana can't be blank")
      end
      it 'last_name_kanaがカタカナ以外だと登録できない' do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'first_name_kanaがカタカナ以外だと登録できない' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'date_birthが空だと登録できない' do
        @user.date_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("date_birth can't be blank")
      end
    end
  end
end