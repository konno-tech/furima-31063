require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { FactoryBot.create(:item) }
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全て入力されていれば登録できること' do
      expect(@item).to be_valid
    end

    it '商品画像がついていなければ登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名がなければ登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明がなければ登録できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーを選択していなければ登録できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態を選択しなければ登録できないこと' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it '配送料の負担を選択しなければ登録できないこと' do
      @item.charge_of_distribution_cost_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Charge of distribution cost can't be blank")
    end

    it '発送元の地域を選択しなければ登録できないこと' do
      @item.forwarding_origin_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Forwarding origin can't be blank")
    end

    it '発送までの日数を選択しなければ登録できないこと' do
      @item.before_forward_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Before forward date can't be blank")
    end

    it '価格を入力しなければ登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が、¥300未満の場合登録できないこと' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end

    it '価格が、¥9,999,999超の場合登録できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end

    it '価格は半角数字以外では登録できないこと' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end
  end
end
