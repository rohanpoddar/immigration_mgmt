FactoryGirl.define do
  factory :passport do
    association :employee
    citizenship "Indian"
    expiry_date Time.now
    number "pa12345"
  end
end