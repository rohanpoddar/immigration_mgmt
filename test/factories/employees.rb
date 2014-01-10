FactoryGirl.define do
  factory :employee do
    category "consultant"
    employee_id "12343"
    name "abc"
    location "bangalore"
    position "developer"
    date_of_joining Time.now
  end
end