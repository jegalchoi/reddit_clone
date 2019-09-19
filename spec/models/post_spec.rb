# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string           not null
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#

require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) { build(:post) }

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:user_id) }
  end

  describe "associations" do
    it { should have_many(:post_subs) }
    it { should have_many(:subs) }
    it { should belong_to(:author) }
    it { should have_many(:comments) }
    it { should have_many(:votes) }
  end
end
