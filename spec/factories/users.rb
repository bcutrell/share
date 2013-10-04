# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{n}dnasty116@yahoo.com"}
    username  "Sam Pashall"
    location "Newton"
    password "spidermanrox798"
  end
end
