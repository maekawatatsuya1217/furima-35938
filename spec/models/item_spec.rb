require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能の実装' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品ができる時' do
      it '正しい情報が入力された時' do
        expect(@item).to be_valid
      end
    end
    context '出品ができない時' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像を入力してください')
      end
      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('名前を入力してください')
      end
      it '商品の説明が必須であること' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('説明を入力してください')
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
      end
      it '商品の状態の情報が必須であること' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('状態は1以外の値にしてください')
      end
      it '配送料の負担の情報が必須であること' do
        @item.shipping_change_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送方法は1以外の値にしてください')
      end
      it '発送元の地域の情報が必須であること' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('地域は1以外の値にしてください')
      end
      it '発送までの日数の情報が必須であること' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数は1以外の値にしてください')
      end
      it '値段の情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('値段を入力してください')
      end
      it '値段は,300円以下の時保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は300以上の値にしてください')
      end
      it '価格は、9999999以上の時保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は9999999以下の値にしてください')
      end
      it '価格は半角数値のみ保存可能であること' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は数値で入力してください')
      end
    end
  end
end
