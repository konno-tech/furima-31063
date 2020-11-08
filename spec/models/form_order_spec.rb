require 'rails_helper'

RSpec.describe FormOrder, type: :model do
  describe '#create' do
    before do
      @form_order = FactoryBot.build(:form_order)
    end

    it '全て入力されていれば登録できること' do
      expect(@form_order).to be_valid
    end

    it '郵便番号にはハイフンが必要であること' do
      @form_order.zip_code = nil
      @form_order.valid?
      expect(@form_order.errors.full_messages).to include("Zip code can't be blank")
    end

    it '郵便番号にはハイフンが必要であること' do
      @form_order.zip_code = '1234567'
      @form_order.valid?
      expect(@form_order.errors.full_messages).to include("Zip code は「-(ﾊｲﾌﾝ)」ありで入力してください")
    end

    it '都道府県を選択する必要があること' do
      @form_order.forwarding_origin_id = nil
      @form_order.valid?
      expect(@form_order.errors.full_messages).to include("Forwarding origin can't be blank")
    end

    it '都道府県に「---」は選択できないこと' do
      @form_order.forwarding_origin_id = '1'
      @form_order.valid?
      expect(@form_order.errors.full_messages).to include("Forwarding origin は「---」以外を選択してください")
    end

    it '市区町村を入力する必要があること' do
      @form_order.municipality = nil
      @form_order.valid?
      expect(@form_order.errors.full_messages).to include("Municipality can't be blank")
    end

    it '番地を入力する必要があること' do
      @form_order.address = nil
      @form_order.valid?
      expect(@form_order.errors.full_messages).to include("Address can't be blank")
    end

    it '建物名を入力しなくても登録できること' do
      @form_order.building_name = nil
      @form_order.valid?
      expect(@form_order).to be_valid
    end

    it '電話番号を入力する必要があること' do
      @form_order.phone_number = nil
      @form_order.valid?
      expect(@form_order.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号にハイフンを入力すると登録できないこと' do
      @form_order.phone_number = '080-1111-22'
      @form_order.valid?
      expect(@form_order.errors.full_messages).to include("Phone number は「-(ﾊｲﾌﾝ)」なしで入力してください")
    end
    
  end
end
