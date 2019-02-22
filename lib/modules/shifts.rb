module Shifts

  def create_shifts(key = @random_number, date = six_digit_date)
    a_shifter(key, date)
    b_shifter(key, date)
    c_shifter(key, date)
    d_shifter(key, date)
  end

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

  def shift_0(letter)
    shifted_set_0 = @characters.rotate(@a_shift)
    new_char_0 = shifted_set_0[@characters.index(letter)]
  end

  def shift_1(letter)
    shifted_set_1 = @characters.rotate(@b_shift)
    new_char_1 = shifted_set_1[@characters.index(letter)]
  end

  def shift_2(letter)
    shifted_set_2 = @characters.rotate(@c_shift)
    new_char_2 = shifted_set_2[@characters.index(letter)]
  end

  def shift_3(letter)
    shifted_set_3 = @characters.rotate(@d_shift)
    new_char_3 = shifted_set_3[@characters.index(letter)]
  end
end
