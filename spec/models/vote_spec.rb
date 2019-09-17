# == Schema Information
#
# Table name: votes
#
#  id           :bigint           not null, primary key
#  value        :integer          not null
#  votable_type :string           not null
#  votable_id   :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Vote, type: :model do
  subject(:vote) { build(:vote) }

  describe "validations" do
    it { should validate_presence_of(:value) }
  end

  describe "associations" do
    it { should belong_to(:votable) }
  end
end
