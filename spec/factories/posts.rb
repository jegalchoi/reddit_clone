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

FactoryBot.define do
  factory :post do
    title { Faker::Book.title }
    url { Faker::Internet.url }
    content { Faker::Food.description }
    user_id { 1 }
  end
end
