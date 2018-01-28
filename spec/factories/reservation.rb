FactoryGirl.define do
  factory :reservation do
    restaurant
    table
    visitor
    guest_count 7
    start_time DateTime.current.beginning_of_day + 9.hours
    end_time DateTime.current.beginning_of_day + 10.hours
  end
end

