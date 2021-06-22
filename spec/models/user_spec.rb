require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'ニックネームが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('ニックネームを入力してください')
    end
    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールを入力してください')
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = 'aaa11'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end
    it 'passwordは数字のみでは登録できないこと' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end
    it 'passwordは全角では登録できない' do
      @user.password = 'ccc１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end
    it 'お名前(全角)は、名字と名前がそれぞれ必須であること' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名前を入力してください')
    end
    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.family_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字は不正な値です')
    end
    it 'first_nameは全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前は不正な値です')
    end
    it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('ナマエを入力してください')
    end
    it 'first_name_kanaは全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = '達也'
      @user.valid?
      expect(@user.errors.full_messages).to include('ナマエは不正な値です')
    end
    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
      @user.family_name_kana = '前川'
      @user.valid?
      expect(@user.errors.full_messages).to include('ミョウジは不正な値です')
    end
    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('誕生日を入力してください')
    end
  end
end
