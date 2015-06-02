FactoryGirl.define do
  factory :user do
    sequence(:first_name) {|n| "John#{n}"}
    sequence(:last_name) {|n| "Smith#{n}"}
    sequence(:email) {|n| "js#{n}@gaa.com"}
    password 'password'
    
    factory :owner do
      # posts_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        projects_count 1
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |user, evaluator|
        create_list(:project, evaluator.projects_count, owner: user)
      end
    end
  end
end