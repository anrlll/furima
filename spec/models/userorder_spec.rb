require 'rails_helper'

RSpec.describe Userorder, type: :model do
  before do
    @userorder = FactoryBot.build(:userorder)
  end

  describe '商品購入' do
    context '商品購入できる場合 ' do
      it 'すべての要素が条件を満たせば購入できる' do
        expect(@userorder).to be_valid
      end
    end
    context '商品購入できない場合' do
      it '郵便番号が空では購入できない' do
        @userorder.postcode = ''
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号にハイフンが含まれていない場合は購入できない' do
        @userorder.postcode = '1234567'
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Postcode is invalid")
      end
      it '郵便番号が全角文字を含んでいると登録できない' do
        @userorder.postcode = '１２３-456'
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Postcode is invalid")
      end
      it '都道府県が初期値では購入できない' do
        @userorder.regiondelivery_id = 1
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Regiondelivery must be other than 1")
      end
      it '市区町村が空では購入できない' do
        @userorder.municipalities = ''
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空では購入できない' do
        @userorder.blocknumber = ''
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Blocknumber can't be blank")
      end
      it '電話番号が空では購入できない' do
        @userorder.telnumber = ''
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Telnumber can't be blank")
      end
      it '電話番号にハイフンを含む場合は購入できない' do
        @userorder.telnumber = '070-9121-33'
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Telnumber is invalid")
      end
      it '電話番号が10桁未満だと購入できない' do
        @userorder.telnumber = '123'
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Telnumber is too short (minimum is 10 characters)")
      end
      it '電話番号が全角数値を含んでいると登録できない' do
        @userorder.telnumber = '０３11111111'
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Telnumber is invalid")
      end
      it 'クレジットカードの情報が誤っている場合は購入できない' do
        @userorder.token = ''
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
