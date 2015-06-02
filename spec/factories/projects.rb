FactoryGirl.define do
  factory :project do
    owner
    sequence(:name) {|n| "Project name#{n}"}
    sequence(:description) {|n| "Project descripitont#{n}"}    
  end
end