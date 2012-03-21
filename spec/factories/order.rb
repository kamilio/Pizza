FactoryGirl.define do
  factory :order do
    user
    status "cart"
  end
end