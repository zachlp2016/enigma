require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/enigma'

class EnigmaTest < Minitest::Test


  def setup
    @enigma = Enigma.new
  end

  def test_enigma_class_exists
    assert_instance_of Enigma, @enigma
  end

  def test_enigma_can_generate_random_number
    assert_equal 5, @enigma.random_number.to_s.chars.count
  end

  def test_enigma_can_create_an_a_key
    assert_equal 2, @enigma.a_key.to_s.chars.count
    assert_equal 2, @enigma.b_key.to_s.chars.count
    assert_equal 2, @enigma.c_key.to_s.chars.count
    assert_equal 2, @enigma.d_key.to_s.chars.count
  end

  def test_enigma_can_generate_master_offset_from_provided_date
    assert_equal "1025", @enigma.master_offset("040895")
  end

  def test_enigma_can_create_todays_date
    assert_instance_of Date, @enigma.todays_date
  end

  def test_enigma_can_create_two_digit_day
    assert_equal 2, @enigma.two_digit_day.chars.count
  end

  def test_enigma_can_create_two_digit_month
    assert_equal 2, @enigma.two_digit_month.chars.count
  end

  def test_enigma_can_create_two_digit_year
    assert_equal 2, @enigma.two_digit_year.chars.count
  end

  def test_enigma_can_create_six_digit_date
    assert_equal 6, @enigma.six_digit_date.chars.count
  end

  def test_enigma_can_create_default_date_from_date_generator
    assert_equal 4, @enigma.master_offset.chars.count
  end

  def test_enigma_can_create_offsets
    skip
    assert_equal 2, @enigma.a_offset.to_s.chars.count
    assert_equal 2, @enigma.b_offset.to_s.chars.count
    assert_equal 2, @enigma.c_offset.to_s.chars.count
    assert_equal 2, @enigma.d_offset.to_s.chars.count
  end
end
