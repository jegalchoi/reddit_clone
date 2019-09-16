# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:session_token) }
  end

  it "should validate length of password" do
    user = build(:user, password: "")
    user.valid?
    expect(user.errors[:password]).to eq(["is too short (minimum is 6 characters)"])
  end

  it "should validate presence of password_digest" do
    user = build(:user, password_digest: nil)
    user.valid?
    expect(user.errors[:password_digest]).to eq(["Password can't be blank"])
  end

  describe "associations" do
    it { should have_many(:subs) }
  end
  
end
