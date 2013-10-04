FactoryGirl.define do
  factory :good do
    title "MyString"
    location "MyString"
    description ""
    association :user
    
    trait :with_image do
      picture { Rack::Test::UploadedFile.new(File.join(Rails.root,'spec', 'support', 'images', ''))}
    end
  end
end