FactoryGirl.define do
  sequence :email do |n|
    "flatiron-student-#{n}@flatironschool.com"
  end

  factory :user do
    name 'Flatiron School'
    email
    password 'testtest'
    password_confirmation 'testtest'
    
    # Child of :user factory, since it's in the `factory :user` block
    factory :admin do
      role 'admin'
    end

  end
end