require 'Date'
require './lib/modules/keys'
require './lib/modules/offsets'

class Enigma

  include Keys
  include Offsets

  attr_reader :random_number

  def initialize
    @random_number = random_number
  end

  def encrypt(message, key, date)

end
