FactoryGirl.define do
  factory :employee do
    category "consultant"
    number "12343"
    name "abc"
    location "bangalore"
    position "developer"
    joining_date 5.years.ago
    exit_date Time.now
  end
end
