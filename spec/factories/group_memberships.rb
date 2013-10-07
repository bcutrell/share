# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group_membership do
    group
    user
    founder false  
  end
end
