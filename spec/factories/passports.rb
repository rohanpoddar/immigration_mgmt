FactoryGirl.define do
  factory :passport do
    association :employee
    citizenship "Indian"
    date_of_expiry Time.now
    passport_number "pa12345"
  end
end