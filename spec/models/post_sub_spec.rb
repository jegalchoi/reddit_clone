# == Schema Information
#
# Table name: post_subs
#
#  id         :bigint           not null, primary key
#  sub_id     :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe PostSub, type: :model do
  subject(:post_sub) { build(:post_sub) }

  describe "validations" do
    it { should validate_presence_of(:sub_id) }
    it { should validate_presence_of(:post_id) }
  end

  describe "associations" do
    it { should belong_to(:sub) }
    it { should belong_to(:post) }
  end
end
