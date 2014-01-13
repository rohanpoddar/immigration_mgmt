FactoryGirl.define do
  factory :visa do
    association :visa_type
    association :passport
  end
end