require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context '商品登録できる場合' do
      it 'すべての要素が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品登録できない場合' do
      it "商品画像が空では投稿できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空では投稿できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品名が40文字を超えると投稿できない" do
        @item.name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it "商品の説明が空では投稿できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "商品の説明が1000文字を超えると投稿できない" do
        @item.description = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
      end
      it "カテゴリーが初期値のままでは投稿できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が初期値のままでは投稿できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "配送料の負担が初期値のままでは投稿できない" do
        @item.costdelivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Costdelivery can't be blank")
      end
      it "発送元の地域が初期値のままでは投稿できない" do
        @item.regiondelivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Regiondelivery can't be blank")
      end
      it "発送までの日数が初期値のままでは投稿できない" do
        @item.datedelivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Datedelivery can't be blank")
      end
      it "販売価格が空では投稿できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "販売価格が300円未満だと投稿できない" do
        @item.price = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "販売価格が9,999,999を超えると投稿できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "価格に半角数字以外が含まれている場合は出品できない" do
        @item.price = "12daer4"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "userが紐づいていなければ出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
