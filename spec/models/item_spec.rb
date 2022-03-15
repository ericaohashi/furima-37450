require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    it'category_idが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Category cant't be blank")
    end

    it'prefecture_idが空では登録できない' do
      @item.prefecture_id =''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Prefecture cant't be blank")
    end

    it'schedule_idが空では登録できない' do
      @item.schedule_id =''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Schedule cant't be blank")
    end

    it'ship_fee_idが空では登録できない' do
      @item.ship_fee_id =''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Ship fee cant't be blank")
    end

    it'item_status_idが空では登録できない' do
      @item.item_status_id =''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Item status cant't be blank")
    end
    it'画像が空では登録できない'do
    @item.image
    @item.valid?
    expect(@item.errors.full_messages).to include ("Image can't be blank")
    end

    it'購入金額が３００円未満では登録できない'do
    @item.price = '100'
    @item.valid?
    expect(@item.errors.full_messages).to include ("Price must be greater than or equal to 300") 
    end
    it'購入金額が¥9,999,999を超えている' do
      @item.price ='99999999'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it '金額が全角では登録できない'do
    @item.price ='６００'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
