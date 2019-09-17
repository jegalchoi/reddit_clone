# == Schema Information
#
# Table name: comments
#
#  id                :bigint           not null, primary key
#  content           :text             not null
#  user_id           :integer          not null
#  post_id           :integer          not null
#  parent_comment_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) { build(:comment)}

  describe "validations" do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:post_id) }
  end

  describe "associations" do
    it { should belong_to(:author) }
    it { should belong_to(:post) }
    it { should have_many(:child_comments) }
  end
end
