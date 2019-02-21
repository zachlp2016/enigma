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
end
