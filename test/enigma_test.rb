require 'minitest/autorun'
require 'minitest/pride'
require 'date'
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
    assert_equal 1, @enigma.a_offset.to_s.chars.count
    assert_equal 1, @enigma.b_offset.to_s.chars.count
    assert_equal 1, @enigma.c_offset.to_s.chars.count
    assert_equal 1, @enigma.d_offset.to_s.chars.count
  end

  def test_enigma_can_create_shifts_with_included_key_and_date
    @enigma.a_shifter("02715", "040895")
    assert_equal 3, @enigma.a_shift
    @enigma.b_shifter("02715", "040895")
    assert_equal 27, @enigma.b_shift
    @enigma.c_shifter("02715", "040895")
    assert_equal 73, @enigma.c_shift
    @enigma.d_shifter("02715", "040895")
    assert_equal 20, @enigma.d_shift
  end
  # def test_enigma_can_create_shifts_without_included_key_and_date
  #   @enigma.random_number_generator
  #   @enigma.a_shifter
  #   assert_equal 2, @enigma.a_shift
  #   @enigma.b_shifter
  #   assert_instance_of Integer, @enigma.b_shift
  #   @enigma.c_shifter
  #   assert_instance_of Integer, @enigma.c_shift
  #   @enigma.d_shifter
  #   assert_instance_of Integer, @enigma.d_shift
  # end

  def test_enigma_create_shifts_method_creates_shifts
    @enigma.create_shifts("02715", "040895")
    assert_equal 3, @enigma.a_shift
    assert_equal 27, @enigma.b_shift
    assert_equal 73, @enigma.c_shift
    assert_equal 20, @enigma.d_shift
  end

  def test_encrypt_method_can_create_shifts
    @enigma.encrypt("Hello World", "02715", "040895")
    assert_equal 3, @enigma.a_shift
    assert_equal 27, @enigma.b_shift
    assert_equal 73, @enigma.c_shift
    assert_equal 20, @enigma.d_shift
  end

  def test_method_split_string_can_divide_message
    assert_equal ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"], @enigma.split_string("Hello World")
  end

  def test_encrypt_method_can_encrypt
    hash = {
    encryption: "keder ohulw",
    key: "02715",
    date: "040895"
  }

    assert_equal hash, @enigma.encrypt("Hello World", "02715", "040895")
  end

  def test_shift_helpers_work
    @enigma.a_shifter("02715", "040895")
    @enigma.b_shifter("02715", "040895")
    @enigma.c_shifter("02715", "040895")
    @enigma.d_shifter("02715", "040895")
    assert_equal "k", @enigma.shift_0("h")
    assert_equal "e", @enigma.shift_1("e")
    assert_equal "d", @enigma.shift_2("l")
    assert_equal "e", @enigma.shift_3("l")
  end

  def test_decrypt_method_can_decrypt
    hash = {
    decryption: "hello world",
    key: "02715",
    date: "040895"
  }
    assert_equal hash, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_shift_helpers_work
    @enigma.a_shifter("02715", "040895")
    @enigma.b_shifter("02715", "040895")
    @enigma.c_shifter("02715", "040895")
    @enigma.d_shifter("02715", "040895")
    assert_equal "h", @enigma.neg_shift_0("k")
    assert_equal "e", @enigma.neg_shift_1("e")
    assert_equal "l", @enigma.neg_shift_2("d")
    assert_equal "l", @enigma.neg_shift_3("e")
  end

  def test_encrypt_method_works_with_a_key_for_todays_date
    assert_instance_of Hash, @enigma.encrypt("Hello World", "02715")
  end

  def test_decrypt_method_works_with_a_key_for_todays_date
    assert_instance_of Hash, @enigma.decrypt("keder ohulw", "02715")
  end

end
