require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end

  describe '商品出品' do
    context '商品登録ができる場合' do
      it '商品名、商品説明、カテゴリー、商品の状態、配送料、発送元、発送までの日数、販売価格が記入してある' do
        expect(@item).to be_valid
      end
    end

    context '商品登録ができない場合' do
      it '商品名が空だと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品説明が空だと登録できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end

      it 'カテゴリーを未選択だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category cant't be blank")
      end

      it 'prefecture_idが未選択では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture cant't be blank")
      end

      it 'schedule_idが未選択では登録できない' do
        @item.schedule_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule cant't be blank")
      end

      it 'ship_fee_idが未選択では登録できない' do
        @item.ship_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship fee cant't be blank")
      end

      it 'item_status_idが未選択では登録できない' do
        @item.item_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status cant't be blank")
      end
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '購入金額が３００円未満では登録できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '購入金額が¥9,999,999を超えている' do
        @item.price = '99999999'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '金額が全角では登録できない' do
        @item.price = '６００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '金額が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '商品がユーザーと紐付いていないと出品登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
