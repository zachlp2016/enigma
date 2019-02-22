module Shifts

  def a_shifter(key = @random_number, date = six_digit_date)
    @a_shift = a_key(key).to_i + a_offset(date)
  end

  def b_shifter(key = @random_number, date = six_digit_date)
    @b_shift = b_key(key).to_i + b_offset(date)
  end

  def c_shifter(key = @random_number, date = six_digit_date)
    @c_shift = c_key(key).to_i + c_offset(date)
  end

  def d_shifter(key = @random_number, date = six_digit_date)
    @d_shift = d_key(key).to_i + d_offset(date)
  end
end
