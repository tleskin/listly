FactoryGirl.define do

  factory :task1, class: Task do
    title 'Title 1'
    body 'Body 1'
    start_date '10/10/2015'
    due_date '10/11/2015'
  end

  factory :task2, class: Task do
    title 'Title 2'
    body 'Body 2'
    start_date '10/10/2015'
    due_date '10/11/2015'
  end

  factory :task3, class: Task do
    title 'Title 3'
    body 'Body 3'
    start_date '10/10/2015'
    due_date '10/11/2015'
  end
end
