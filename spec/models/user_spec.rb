require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できるとき' do
      it '項目が全て存在すれば登録できる' do
        expect(@user).to be_valid  
      end
    end

    context '新規登録できないとき' do
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = "12356a"
        @user.password_confirmation = "123456a"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '1234a'
        @user.password_confirmation = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは128文字以内で入力してください")
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordが半角英語のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordが全角では登録できない' do
        @user.password = '１２３４５A'
        @user.password_confirmation = '１２３４５A'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（性）を入力してください")
      end
      it 'family_nameが半角では登録できない' do
        @user.family_name = "TEST"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（性）は不正な値です")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（名）を入力してください")
      end 
      it 'first_nameが半角では登録できない' do
        @user.first_name = "TEST"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（名）は不正な値です")
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（性）カナを入力してください")
      end
      it 'family_name_kanaが半角では登録できない' do
        @user.family_name_kana = "TEST"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（性）カナは不正な値です")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（名）カナを入力してください")
      end
      it 'first_name_kanaが半角では登録できない' do
        @user.first_name_kana = "TEST"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（名）カナは不正な値です")
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end

    end
  end
end