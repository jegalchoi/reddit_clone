# == Schema Information
#
# Table name: subs
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#

FactoryBot.define do
  factory :sub do
    title { Faker::Book.title }
    description { Faker::Quote.singular_siegler }
    user_id { 1 }
  end
end
