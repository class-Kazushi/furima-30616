require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it "nicknameとemail、passwordとpassword_confirmation、family_nameとfirst_name、family_furiganaとfirst_furigana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000aaa"
        @user.password_confirmation = "000aaa"
        expect(@user).to be_valid
      end
      it "passwordが半角英数字混合されていれば登録できる" do
        @user.password = "000aaa"
        @user.password_confirmation = "000aaa"
        expect(@user).to be_valid
      end
      it "family_nameが全角で入力されていれば登録できる" do
        @user.family_name = "あア阿"
        expect(@user).to be_valid
      end
      it "first_nameが全角で入力されていれば登録できる" do
        @user.first_name = "いイ井"
        expect(@user).to be_valid
      end
      it "family_furiganaが全角カナで入力されていれば登録できる" do
        @user.family_furigana = "アアア"
        expect(@user).to be_valid
      end
      it "first_furiganaが全角カナで入力されていれば登録できる" do
        @user.first_furigana = "イイイ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@が含まれていないと登録できない" do
        @user.email = "aaa12345gmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "123ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英数字混合で入力されていなければ登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "family_nameが空では登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name is invalid")
      end
      it "family_nameが全角で入力されていなれば登録できない" do
        @user.family_name = "abc123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it "first_nameが全角で入力されていなれば登録できない" do
        @user.first_name = "abc123"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "family_furiganaが空では登録できない" do
        @user.family_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family furigana can't be blank", "Family furigana is invalid")
      end
      it "family_furiganaが全角カナで入力されていなれば登録できない" do
        @user.family_furigana = "ああ阿"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family furigana is invalid")
      end
      it "first_furiganaが空では登録できない" do
        @user.first_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana can't be blank", "First furigana is invalid")
      end
      it "first_furiganaが全角カナで入力されていなければ登録できない" do
        @user.first_furigana = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana is invalid")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
