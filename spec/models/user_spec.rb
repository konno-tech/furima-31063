require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do 
      @user = FactoryBot.build(:user)
    end

    it "全て入力されていれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録されないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録されないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合は登録されないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailに「@」が含まれていない場合は登録されないこと" do
      @user.email = "abc123.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録されないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが数字だけでは登録されないこと" do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は英字と数字の両方を含めて設定してください")
    end

    it "passwordが英字だけでは登録されないこと" do
      @user.password = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は英字と数字の両方を含めて設定してください")
    end

    it "passwordが6文字以下では登録されないこと" do
      @user.password = "1qa1q"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordとpassword_confirmationが不一致では登録されないこと" do
      @user.password = "1qa1qa"
      @user.password_confirmation = "1qa1qa1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "お名前（全角）の苗字（last_name）が空では登録されないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "お名前（全角）の苗字（last_name）が漢字またはひらがなまたはカタカナ以外では登録されないこと" do
      @user.last_name = "mr.brown"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name は全角（漢字・ひらがな・カタカナ）を使用してください")
    end

    it "お名前（全角）の名前（first_name）が空では登録されないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "お名前（全角）の名前（first_name）が漢字またはひらがなまたはカタカナ以外では登録されないこと" do
      @user.first_name = "mr.brown"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は全角（漢字・ひらがな・カタカナ）を使用してください")
    end

    it "お名前カナ（全角）の苗字（last_name_kana）が空では登録されないこと" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "お名前カナ（全角）の苗字（last_name_kana）がカタカナ以外では登録されないこと" do
      @user.last_name_kana = "mr.brawn"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana は全角（カタカナ）を使用してください")
    end

    it "お名前カナ（全角）の名前（first_name_kana）が空では登録されないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "お名前カナ（全角）の名前（first_name_kana）がカタカナ以外では登録されないこと" do
      @user.first_name_kana = "mr.brawn"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana は全角（カタカナ）を使用してください")
    end

    it "生年月日が空では登録されないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end
