require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include( "Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it "emailが重複していたら登録できない"do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')

    end

    it "emailは@を含まないと登録できない"do
     @user.email = 'testmail'
     @user.valid?
     expect(@user.errors.full_messages).to include('Email is invalid')
    end
  
    it "first_nameが空では登録できない"do
      @user.first_name =''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
  
    it "first_nameが半角だと登録できない"do
      @user.first_name = '1111'
     @user.valid?
     expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "last_nameが空では登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    
    it "last_nameが半角だと登録できない"do
      @user.last_name = '1111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "first_kanaが空では登録できない" do
      @user.first_kana =''
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana is invalid")
    end

    it "first_kanaが半角だと登録できない"do
      @user.first_kana ="1111"
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana is invalid")
    end

    it "last_kanaが空では登録できない" do
      @user.last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana is invalid")
    end

    it "last_kanaが半角英数字では登録できない"do
      @user.last_kana ='1111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana is invalid")
    end

    it "birthが空では登録できない" do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end
   
    it "passwordが６文字未満だと、登録できない" do
      @user.password ='12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが数字のみだと保存できない"do
      @user.password ='123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordがアルファベットのみだと登録できない" do
      @user.password ='abcdef'
      @user.valid?
     expect(@user.errors.full_messages).to include("Password is invalid")
    end
  end
  end


