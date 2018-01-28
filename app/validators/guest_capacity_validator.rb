class GuestCapacityValidator < ActiveModel::Validator
  def validate(record)
    if table = record.table
      capacity = record.guest_count.to_i
      min_guest_capacity = table.min_guest_capacity
      max_guest_capacity = table.max_guest_capacity

      if(min_guest_capacity > capacity)
        record.errors[:guest_count] << "should be greater than #{min_guest_capacity}"
      elsif capacity > max_guest_capacity
        record.errors[:guest_count] << "should be less than #{max_guest_capacity}"
      end
    end
  end
end
