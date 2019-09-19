# == Schema Information
#
# Table name: subs
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#

require 'rails_helper'

RSpec.describe Sub, type: :model do
  subject(:sub) { build(:sub) }

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end

  describe "associations" do
    it { should belong_to(:moderator) }
    it { should have_many(:post_subs) }
    it { should have_many(:posts) }
  end
end
