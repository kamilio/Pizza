# Defines a new sequence
FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

# Defines a new sequence
FactoryGirl.define do
  sequence :login do |n|
    "person#{n}"
  end
end

FactoryGirl.define do
  factory :user do
    email
    login
    password 'kamil'
    password_confirmation 'kamil'
    
    factory :guest do
      roles [:guest]
    end
    
    factory :stuff do
      roles [:stuff]
    end
    
    factory :admin do
      roles [:admin]
    end
  end
end