require 'Date'
require './lib/modules/keys'
require './lib/modules/offsets'
require './lib/modules/shifts'

class Enigma

  include Keys
  include Offsets
  include Shifts

  attr_reader :random_number,
              :a_shift,
              :b_shift,
              :c_shift,
              :d_shift

  def initialize
    @random_number = random_number_generator
    @a_shift = 0
    @b_shift = 0
    @c_shift = 0
    @d_shift = 0
    @characters = ("a".."z").to_a << " "
  end

  def split_string

  end

  def encrypt(message, key = @random_number, date = six_digit_date)
    create_shifts(key, date)
    shifted_letters = split_string(message).map.with_index do |letter, index|

    end
  binding.pry
  end

end
