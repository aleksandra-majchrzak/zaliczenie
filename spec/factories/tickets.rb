FactoryGirl.define do
  factory :ticket do
    sequence(:name) {|n| "Ticket#{n}"}
    sequence(:description) {|n| "Description#{n}"}
    sequence(:priority) {|n| "#{n%5+1}"}
    
    password 'password'
  end
end