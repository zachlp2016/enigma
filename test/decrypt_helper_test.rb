require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require 'pry'
require './lib/decrypt_helper.rb'


class DecryptHelperTest < Minitest::Test

  def setup
    @decrypt_helper = DecryptHelper.new
  end

  def test_decrypt_helper_class_exists
    assert_instance_of DecryptHelper, @decrypt_helper
  end

  def test_decrypt_helper_method_can_return_decrypt_message
    hash = {
    decryption: "hello world",
    key: "02715",
    date: "040895"
  }
    assert_equal hash, @decrypt_helper.decryption("keder ohulw", "02715", "040895")
  end

  def test_decryption_method_works_with_non_standard_characters
    hash = {
    decryption: "hello world",
    key: "02715",
    date: "040895"
            }
    assert_equal hash, @decrypt_helper.decryption("keder!sprrdx!", "02715", "040895")
  end
end
