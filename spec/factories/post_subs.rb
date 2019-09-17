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

FactoryBot.define do
  factory :post_sub do
    sub_id { 1 }
    post_id { 1 }    
  end
end
