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

class Post < ApplicationRecord
  include Votable
  
  validates :title, presence: true, uniqueness: true
  validates :user_id, presence: true
  validate :at_least_one_sub

  has_many :post_subs, inverse_of: :post, dependent: :destroy

  has_many :subs, through: :post_subs, source: :sub

  belongs_to :author,
    primary_key: 'id',
    foreign_key: 'user_id',
    class_name: 'User'

  has_many :comments, inverse_of: :post

  def comments_by_parent_id
    comments = Hash.new { |h,k| h[k] = [] }
    self.comments.includes(:author).each do |comment|
      comments[comment.parent_comment_id] << comment
    end
    comments
  end

  def at_least_one_sub
    if self.sub_ids.empty?
      errors.add(:post, "must have at least one sub")
    end
  end
end
