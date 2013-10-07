FactoryGirl.define do
  factory :good do
    title "MyString"
    location "MyString"
    description ""
    association :user
    
    trait :with_image do
      image { Rack::Test::UploadedFile.new(File.join(Rails.root,'spec', 'support', 'images', 'test.jpg'))}
    end

    trait :public do 
      state "public"
    end
    trait :private do 
      state "private"
    end 

    trait :in_group do 
      association :group
    end
  end
end