class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # 新規登録画面の入力欄順にバリデーションを設定
  validates :nickname, presence: true

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '英字と数字の両方を含めて設定してください' }
  validates :password_confirmation, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '英字と数字の両方を含めて設定してください' }

  validates :last_name_full, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角（漢字・ひらがな・カタカナ）を使用してください' }
  validates :first_name_full, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角（漢字・ひらがな・カタカナ）を使用してください' }
  
  validates :last_name_half, presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角（カタカナ）を使用してください' }
  validates :first_name_half, presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角（カタカナ）を使用してください' }

  validates :birthday, presence: true

end
