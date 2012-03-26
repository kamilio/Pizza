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
    roles ["admin"]
    name "Herr Admin"
    address "Tada\nNana"
    
    factory :registered do
      login "registered"
      password "registered"
      password_confirmation "registered"
      roles ["registered"]
    end
    
    factory :stuff do
      login "stuff"
      password "stuff"
      password_confirmation "stuff"
      roles ["stuff"]
    end
    
    factory :admin do
      login "admin"
      password "admin"
      password_confirmation "admin"
      roles ["admin"]
    end
  end
end