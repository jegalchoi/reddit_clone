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

class Vote < ApplicationRecord
  validates :value, presence: true, inclusion: { in: [-1, +1] }
  validates :votable_type, uniqueness: { scope: :votable_id }

  belongs_to :votable, polymorphic: true
end
