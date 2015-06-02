FactoryGirl.define do
  factory :project do
    owner
    sequence(:name) {|n| "Project name#{n}"}
    sequence(:description) {|n| "Project descripitont#{n}"}   
    
    transient do
      tickets_count 1
    end
      
    after(:create) do |project, evaluator|
      create_list(:ticket, evaluator.tickets_count, project: project)
    end
  end
end