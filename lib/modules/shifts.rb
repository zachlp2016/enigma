module Shifts

  def a_shifter(key = @random_number, date = six_digit_date)
    @a_shift = a_key(key).to_i + a_offset(date)
  end


end
