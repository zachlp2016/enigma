require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require 'pry'
require './lib/shifts.rb'


class ShiftsTest < Minitest::Test

  def setup
    @shifts = Shifts.new
  end

  def test_shifts_class_exists
    assert_instance_of Shifts, @shifts
  end

  def test_shifts_class_has_characters
    expected_arr = ["a", "b", "c", "d", "e", "f", "g",
      "h", "i", "j", "k", "l", "m", "n", "o", "p", "q",
      "r", "s", "t", "u", "v", "w", "x", "y", "z", " "
    ]
    assert_equal expected_arr, @shifts.characters
  end

  def test_shifts_can_create_an_a_key
    assert_equal 2, @shifts.a_key.to_s.chars.count
    assert_equal 2, @shifts.b_key.to_s.chars.count
    assert_equal 2, @shifts.c_key.to_s.chars.count
    assert_equal 2, @shifts.d_key.to_s.chars.count
  end

  def test_shifts_can_generate_master_offset_from_provided_date
    assert_equal "1025", @shifts.master_offset("040895")
  end

  def test_shifts_can_create_todays_date
    assert_instance_of Date, @shifts.todays_date
  end

  def test_shifts_can_create_two_digit_day
    assert_equal 2, @shifts.two_digit_day.chars.count
  end

  def test_shifts_can_create_two_digit_month
    assert_equal 2, @shifts.two_digit_month.chars.count
  end

  def test_shifts_can_create_two_digit_year
    assert_equal 2, @shifts.two_digit_year.chars.count
  end

  def test_shifts_can_create_six_digit_date
    assert_equal 6, @shifts.six_digit_date.chars.count
  end

  def test_shifts_can_create_default_date_from_date_generator
    assert_equal 4, @shifts.master_offset.chars.count
  end

  def test_shifts_can_create_offsets
    assert_equal 1, @shifts.a_offset.to_s.chars.count
    assert_equal 1, @shifts.b_offset.to_s.chars.count
    assert_equal 1, @shifts.c_offset.to_s.chars.count
    assert_equal 1, @shifts.d_offset.to_s.chars.count
  end

  def test_shifts_can_create_shifts_with_included_key_and_date
    @shifts.a_shifter("02715", "040895")
    assert_equal 3, @shifts.a_shift
    @shifts.b_shifter("02715", "040895")
    assert_equal 27, @shifts.b_shift
    @shifts.c_shifter("02715", "040895")
    assert_equal 73, @shifts.c_shift
    @shifts.d_shifter("02715", "040895")
    assert_equal 20, @shifts.d_shift
  end

  def test_shifts_create_shifts_method_creates_shifts
    @shifts.create_shifts("02715", "040895")
    assert_equal 3, @shifts.a_shift
    assert_equal 27, @shifts.b_shift
    assert_equal 73, @shifts.c_shift
    assert_equal 20, @shifts.d_shift
  end

  def test_create_shifts_can_create_shifts
    @shifts.create_shifts("02715", "040895")
    assert_equal 3, @shifts.a_shift
    assert_equal 27, @shifts.b_shift
    assert_equal 73, @shifts.c_shift
    assert_equal 20, @shifts.d_shift
  end

  def test_method_split_string_can_divide_message
    assert_equal ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"], @shifts.split_string("Hello World")
  end

  def test_shift_helpers_work
    @shifts.a_shifter("02715", "040895")
    @shifts.b_shifter("02715", "040895")
    @shifts.c_shifter("02715", "040895")
    @shifts.d_shifter("02715", "040895")
    assert_equal "k", @shifts.shift_0("h")
    assert_equal "e", @shifts.shift_1("e")
    assert_equal "d", @shifts.shift_2("l")
    assert_equal "e", @shifts.shift_3("l")
  end
end
