require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'ニックネームが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = 'aaa11'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                    'Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordは数字のみでは登録できないこと' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password には英字と数字の両方を含めて設定してください")
    end
    it 'passwordは全角では登録できない' do
      @user.password = 'ccc１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password には英字と数字の両方を含めて設定してください")
    end
    it 'お名前(全角)は、名字と名前がそれぞれ必須であること' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.family_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
    end
    it 'first_nameは全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana is invalid')
    end
    it 'first_name_kanaは全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = '達也'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
      @user.family_name_kana = '前川'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid')
    end
    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
