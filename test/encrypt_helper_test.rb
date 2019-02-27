require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require 'pry'
require './lib/encrypt_helper.rb'


class EnigmaTest < Minitest::Test

  def setup
    @encrypt_helper = EncryptHelper.new
  end

  def test_encrypt_helper_class_exists
    assert_instance_of EncryptHelper, @encrypt_helper
  end

  def test_encrypt_helper_method_can_return_encrypt_message
    hash = {
    encryption: "keder ohulw",
    key: "02715",
    date: "040895"
            }

    assert_equal hash, @encrypt_helper.encryption("Hello World", "02715", "040895")
  end

  def test_encryption_method_works_with_non_standard_characters
    hash = {
    encryption: "keder!sprrdx!",
    key: "02715",
    date: "040895"
            }
    assert_equal hash, @encrypt_helper.encryption("Hello! World!", "02715", "040895")
  end


end
