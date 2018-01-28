FactoryGirl.define do
  factory :restaurant do
    name "Sample Restaurant"
    email "some_restaurant@gmail.com"
    phone "+601234567890"
    shift_timings [{"name"=>"Morning shift", "start_time"=>"09:00", "end_time"=>"13:00"},
                   {"name"=>"Afternon Shift", "start_time"=>"15:00", "end_time"=>"18:00"},
                   {"name"=>"Evening Shift", "start_time"=>"20:00", "end_time"=>"23:00"}]
  end
end
