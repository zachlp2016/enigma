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

end
