module Shifts

  def a_shift(key = @random_number, date = six_digit_date)
    a_key(key) + a_offset(date)
  end

end
