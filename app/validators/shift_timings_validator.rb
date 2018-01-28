class ShiftTimingsValidator < ActiveModel::Validator
  def validate(record)
    restaurant = record.restaurant
    start_hour = record.start_time.hour
    end_hour   = record.end_time.hour
    shift_found = false

    shift_time_ranges(restaurant.shift_timings).each do |shift_time_range|
      tod_shift = shift(shift_time_range)
      if(tod_shift.include?(Tod::TimeOfDay.new(start_hour)))
        shift_found = true

        if(tod_shift.include?(Tod::TimeOfDay.new(end_hour)))
          break;
        else
          record.errors[:base] << "Reservation doesn't lie in the restaurant shift."
        end
      else
        shift_found = false
        # This is not the right shift to be in.
      end
    end
    record.errors[:base] << "Reservation doesn't lie in the restaurant shift." unless shift_found
  end

  private

  def shift_time_ranges(shift_timings)
    shift_timings.collect do |shift_timing|
      [
        Tod::TimeOfDay.parse(shift_timing[:start_time]),
        Tod::TimeOfDay.parse(shift_timing[:end_time])
      ]
    end
  end

  def shift(shift_time_range)
    Tod::Shift.new(shift_time_range.first, shift_time_range.last)
  end
end
