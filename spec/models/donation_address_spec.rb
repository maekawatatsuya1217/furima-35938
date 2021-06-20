require 'rails_helper'

RSpec.describe DonationAddress, type: :model do
  describe '商品購入機能の実装' do
    before do
      @donation_address = FactoryBot.build(:donation_address)
    end

    # context '保存できるとき' do
    #   it '正しい情報が入力されたとき' do
    #     expect(@donation_address).to be_valid
    #   end
    #   it '建物名無しでも保存できること' do
    #     @donation_address.building_name = ''
    #     @donation_address.valid?
    #     expect(@donation_address).to be_valid
    #   end
    # end
    context '保存できないとき' do
      it '郵便番号が必須であること' do
        @donation_address.post_number = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Post number can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @donation_address.post_number = 1111111
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Post number is invalid", "Token can't be blank")
      end
      it '都道府県が必須であること' do
        @donation_address.area_id = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Area can't be blank", "Token can't be blank")
      end
      it '市区町村が必須であること' do
        @donation_address.city = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が必須であること' do
        @donation_address.address = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が必須であること' do
        @donation_address.phone_number = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid", "Token can't be blank")
      end
      it '電話番号は,9桁以内の半角数値では保存できないこと' do
        @donation_address.phone_number = 111111111
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Phone number is invalid", "Token can't be blank")
      end
      it '電話番号は12桁以上の半角数値では保存できないこと' do
        @donation_address.phone_number = 111111111111
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Phone number is invalid", "Token can't be blank")
      end
    end
  end
end
