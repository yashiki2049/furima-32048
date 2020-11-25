require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録情報の登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "すべての値が正しく入力されていれば登録できること" do
      expect(@user).to be_valid
    end
    it "nicknameが空だと登録できないこと" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "birth_dateが空だと登録できないこと" do
      @user.birth_date = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end


    it "emailが空だと登録できないこと" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailは@を含んでいないと登録できないこと" do
      @user.email = "testmail"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end


    it "passwoedが空だと登録できないこと" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwoedが6文字以下だと登録できないこと" do
      @user.password = "mm111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwoedは半角英数字混合でないと登録できないこと" do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it "passwoedとpassword_confirmationが一致していないと登録できないこと" do
      @user.password = "mmm111"
      @user.password_confirmation = "111mmm"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwoedが存在してもpassword_confirmationが空だと登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


    it "last_nameが空だと登録できないこと" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_nameが空だと登録できないこと" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_nameが全角日本語でないと登録できないこと" do
      @user.last_name = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end
    it "first_nameが全角日本語でないと登録できないこと" do
      @user.first_name = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
    end


    it "last_name_kanaが空だと登録できないこと" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "first_name_kanaが空だと登録できないこと" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "last_name_kanaが全角カタカナでないと登録できないこと" do
      @user.last_name_kana = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
    end
    it "first_name_kanaが全角カタカナでないと登録できないこと" do
      @user.first_name_kana = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
    end
  end
end
