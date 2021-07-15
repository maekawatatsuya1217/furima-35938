require 'rails_helper'

RSpec.describe DonationAddress, type: :model do
  describe '商品購入機能の実装' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @donation_address = FactoryBot.build(:donation_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '保存できるとき' do
      it '正しい情報が入力されたとき' do
        expect(@donation_address).to be_valid
      end
      it '建物名無しでも保存できること' do
        @donation_address.building_name = ''
        @donation_address.valid?
        expect(@donation_address).to be_valid
      end
    end
    context '保存できないとき' do
      it '郵便番号が必須であること' do
        @donation_address.post_number = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('郵便番号を入力してください')
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @donation_address.post_number = 1_111_111
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it '都道府県が必須であること' do
        @donation_address.area_id = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('都道府県を入力してください')
      end
      it '都道府県のidが1だと保存できないこと' do
        @donation_address.area_id = 1
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('都道府県は1以外の値にしてください')
      end
      it '市区町村が必須であること' do
        @donation_address.city = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('市区町村を入力してください')
      end
      it '番地が必須であること' do
        @donation_address.address = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('番地を入力してください')
      end
      it '電話番号が必須であること' do
        @donation_address.phone_number = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('電話番号を入力してください')
      end
      it '電話番号は,9桁以内の半角数値では保存できないこと' do
        @donation_address.phone_number = 111_111_111
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '電話番号は12桁以上の半角数値では保存できないこと' do
        @donation_address.phone_number = 111_111_111_111
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '電話番号が半角数字のみでないと登録できないこと（英字混合だと登録できないこと）' do
        @donation_address.phone_number = 'aaaaa11111'
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '全角数字だと登録できないこと' do
        @donation_address.phone_number = '１１１１１１１１１１'
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'tokenが空では購入できないこと' do
        @donation_address.token = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('トークンを入力してください')
      end
      it 'user_idが空では登録できないこと' do
        @donation_address.user_id = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('ユーザーを入力してください')
      end
      it 'item_idが空では登録できないこと' do
        @donation_address.item_id = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('商品名を入力してください')
      end
    end
  end
end
