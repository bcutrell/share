FactoryGirl.define do
  factory :good do
    title "MyString"
    location "MyString"
    description ""
    association :user
    
    trait :with_image do
      image { Rack::Test::UploadedFile.new(File.join(Rails.root,'spec', 'support', 'images', 'test.jpg'))}
    end
  end
end