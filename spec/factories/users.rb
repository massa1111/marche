FactoryBot.define do
  factory :user do
    name                  {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    
    after(:build) do |user|
      user.profile_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end