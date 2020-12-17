require 'rails_helper'

RSpec.describe Buyer, type: :model do
  before do
    @buyer = FactoryBot.build(:buyer)
  end

  describe '商品購入登録' do
    context '商品購入登録がうまくいく時' do
      it "全ての値が正しく入力されていれば保存できること" do
        expect(@buyer).to be_valid
      end
      it "building_nameが空でも保存できること" do
        @buyer.building_name = ""
        expect(@buyer).to be_valid
      end
    end

    context '商品購入登録がうまくいかない時' do
      it "postal_codeが空だと登録できないこと" do
        @buyer.postal_code = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end
      it "postal_codeにハイフンがないと登録できないこと" do
        @buyer.postal_code = "1234567"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "postal_codeは全角数字では登録できないこと" do
        @buyer.postal_code = "３３３-３３３３"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "prefecture_idが1だと登録できないこと" do
        @buyer.prefecture_id = 1
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空だと登録できないこと" do
        @buyer.city = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("City can't be blank")
      end
      it "house_numberが空では登録できないこと" do
        @buyer.house_number = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("House number can't be blank")
      end
      it "phone_numberが空では登録できないこと" do
        @buyer.phone_number = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが10桁未満だと登録できないこと" do
        @buyer.phone_number = "090111122"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number is invalid. Include up to 11 digits numbers")
      end
      it "phone_numberが12桁以上だと登録できないこと" do
        @buyer.phone_number = "090111122222"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number is invalid. Include up to 11 digits numbers")
      end
      it "phone_numberが0から始まる数字でないと登録できないこと" do
        @buyer.phone_number = "19011112222"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number is invalid. Include up to 11 digits numbers")
      end
      it "phone_numberが全角数字だと登録できないこと" do
        @buyer.phone_number = "０９０１１１１３３３３"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number is invalid. Include up to 11 digits numbers")
      end
      it "tokenが空では登録できないこと" do
        @buyer.token = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空では登録できないこと" do
        @buyer.user_id = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では登録できないこと" do
        @buyer.item_id = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end