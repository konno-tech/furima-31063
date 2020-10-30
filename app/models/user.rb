class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # 新規登録画面の入力欄順にバリデーションを設定
  with_options presence: true do
    validates :nickname

    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英字と数字の両方を含めて設定してください' }
    validates :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英字と数字の両方を含めて設定してください' }

    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）を使用してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）を使用してください' }

    validates :last_name_kana, format: { with: /\A[ァ-ン]+\z/, message: 'は全角（カタカナ）を使用してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ン]+\z/, message: 'は全角（カタカナ）を使用してください' }

    validates :birthday
  end

  has_many :items
end
