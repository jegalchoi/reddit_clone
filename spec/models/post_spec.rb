# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string           not null
#  content    :text             not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) { build(:post) }

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:sub_id) }
  end

  describe "associations" do
    it { should have_many(:post_subs) }
    it { should have_many(:subs) }
  end
end
