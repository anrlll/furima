require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品出品機能" do
    it "商品画像が空では投稿できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名が空では投稿できない" do
    end
    it "商品名が40文字を超えると投稿できない" do
    end
    it "商品の説明が空では投稿できない" do
    end
    it "商品の説明が1000文字を超えると投稿できない" do
    end
    it "カテゴリーが初期値のままでは投稿できない" do
    end
    it "商品の状態が初期値のままでは投稿できない" do
    end
    it "配送料の負担が初期値のままでは投稿できない" do
    end
    it "発送元の地域が初期値のままでは投稿できない" do
    end
    it "発送までの日数が初期値のままでは投稿できない" do
    end
    it "販売価格が空では投稿できない" do
    end
    it "販売価格が300円未満だと投稿できない" do
    end
    it "販売価格が9,999,999を超えると投稿できない" do
    end
  end
end
