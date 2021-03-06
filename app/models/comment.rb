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

class Comment < ApplicationRecord
  include Votable
  
  validates :content, presence: true

  belongs_to :author,
    primary_key: 'id',
    foreign_key: 'user_id',
    class_name: 'User',
    inverse_of: :comments

  belongs_to :post, inverse_of: :comments

  has_many :child_comments,
    primary_key: 'id',
    foreign_key: 'parent_comment_id',
    class_name: 'Comment'

  belongs_to :parent_comment,
    primary_key: 'id',
    foreign_key: 'parent_comment_id',
    class_name: 'Comment',
    optional: true
end
