require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchases_shipping = FactoryBot.build(:PurchasesShipping, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '個人情報入力ページ' do
    context '商品購入ができる場合' do
      it '郵便番号、都道府県、市区町村、番地、電話番号が記入してある' do
        expect(@purchases_shipping).to be_valid
      end
      it '建物名は空でも保存ができる' do
        @purchases_shipping.building = ''
        expect(@purchases_shipping).to be_valid
      end

      it 'priceとtokenがあれば保存ができること' do
        expect(@purchases_shipping).to be_valid
      end
    end

    context '商品購入ができない' do
      it '郵便番号が空では登録できない' do
        @purchases_shipping.post = ''
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("Post can't be blank")
      end

      it '郵便番号が全角であると登録できない' do
        @purchases_shipping.post = '１２３-４５６７'
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include('Post is invalid')
      end

      it '郵便番号にハイフンがないと登録できない' do
        @purchases_shipping.post = '1234567'
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include('Post is invalid')
      end

      it '都道府県を選択しないと登録できない' do
        @purchases_shipping.prefecture_id = '1'
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が必須であること' do
        @purchases_shipping.city = ''
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること' do
        @purchases_shipping.address = ''
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では登録できない' do
        @purchases_shipping.phone = ''
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号が全角だと登録できない' do
        @purchases_shipping.phone = '０１２３４５６７８９'
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include('Phone is invalid')
      end

      it '電話番号が９桁以下だと登録できない' do
        @purchases_shipping.phone = '1234567'
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include('Phone is invalid')
      end

      it '電話番号が１２桁以上であると登録できない' do
        @purchases_shipping.phone = '1234567890123'
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include('Phone is invalid')
      end

      it '電話番号にハイフンを含むと登録できない' do
        @purchases_shipping.phone = '123-4567-1234'
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include('Phone is invalid')
      end

      it 'tokenが空では登録できない' do
        @purchases_shipping.token = nil
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
