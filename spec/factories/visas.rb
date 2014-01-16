FactoryGirl.define do
  factory :visa do
    association :passport
    association :visa_type
    status 'Stamped'
  end
end