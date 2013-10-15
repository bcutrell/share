# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    name "NewGroup"
    password "password"
    password_confirmation "password"

    trait :with_good do 
     after(:create) do |group|
        FactoryGirl.create(:good, :with_image, group: group)
      end
    end 
  end
end
