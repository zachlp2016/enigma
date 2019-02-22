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

  def test_enigma_can_generate_master_offset
    assert_equal 4, @enigma.master_offset.to_s.chars.count
  end

  def test_enigma_can_create_offsets
    assert_equal 2, @enigma.a_offset.to_s.chars.count
    assert_equal 2, @enigma.b_offset.to_s.chars.count
    assert_equal 2, @enigma.c_offset.to_s.chars.count
    assert_equal 2, @enigma.d_offset.to_s.chars.count
  end
end
