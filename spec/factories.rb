FactoryGirl.define do
  factory :consultant do
    first_name     "Michael"
    last_name      "Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end