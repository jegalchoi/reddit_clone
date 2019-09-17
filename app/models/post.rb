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

class Post < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :sub_id, presence: true

  has_many :post_subs
  has_many :subs, through: :post_subs
  has_many :comments
end
