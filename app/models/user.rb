class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,presence:true
         validates :last_name,format:{with:/\A[ぁ-んァ-ン一-龥]/},presence:true # 全角ひらがな、全角カタカナ、漢字のみ
         validates :first_name,format:{with:/\A[ぁ-んァ-ン一-龥]/},presence:true # 全角ひらがな、全角カタカナ、漢字のみ
         validates :last_kana,format:{with:/\A[ァ-ヶー－]+\z/},presence:true # 全角カタカナ
         validates :first_kana,format:{with:/\A[ァ-ヶー－]+\z/},presence:true # 全角カタカナ
         validates :password,presence:true,length: {minimum: 6 },format:{ with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
         validates :birth,presence:true
         
end
