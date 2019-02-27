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

  def test_encrypt_method_can_encrypt
    hash = {
    encryption: "keder ohulw",
    key: "02715",
    date: "040895"
  }

    assert_equal hash, @enigma.encrypt("Hello World", "02715", "040895")
  end

  def test_decrypt_method_can_decrypt
    hash = {
    decryption: "hello world",
    key: "02715",
    date: "040895"
  }
    assert_equal hash, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_encrypt_method_works_with_a_key_for_todays_date
    assert_instance_of Hash, @enigma.encrypt("Hello World", "02715")
  end

  def test_decrypt_method_works_with_a_key_for_todays_date
    assert_instance_of Hash, @enigma.decrypt("keder ohulw", "02715")
  end

  def test_encrypt_method_works_without_a_key_or_a_date
    assert_instance_of Hash, @enigma.encrypt("hello world")
  end

  def test_encrypt_method_works_with_non_standard_characters
    hash = {
    encryption: "keder!sprrdx!",
    key: "02715",
    date: "040895"
            }
    assert_equal hash, @enigma.encrypt("Hello! World!", "02715", "040895")
  end

  def test_decrypt_method_works_with_non_standard_characters
    hash = {
    decryption: "hello world",
    key: "02715",
    date: "040895"
            }
    assert_equal hash, @enigma.decrypt("keder!sprrdx!", "02715", "040895")

  end
end
