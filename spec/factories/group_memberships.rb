# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group_membership do
    group_id 1
    user_id 1
    founder false
  end
end
