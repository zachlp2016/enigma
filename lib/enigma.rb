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

  def split_string(message)
    message.downcase.split("")
  end

  def encrypt(message, key = @random_number, date = six_digit_date)
    encrypt_hash = {}
    encrypted_message = ""
    create_shifts(key, date)
    split_string(message).map.with_index do |letter, index|
      if index == 0 || index == 4 || index == 8
        shifted_set_0 = @characters.rotate(@a_shift)
        new_char_0 = shifted_set_0[@characters.index(letter)]
        encrypted_message << new_char_0
      elsif index == 1 || index == 5 || index == 9
        shifted_set_1 = @characters.rotate(@b_shift)
        new_char_1 = shifted_set_1[@characters.index(letter)]
        encrypted_message << new_char_1
      elsif index == 2 || index == 6 || index == 10
        shifted_set_2 = @characters.rotate(@c_shift)
        new_char_2 = shifted_set_2[@characters.index(letter)]
        encrypted_message << new_char_2
      else index == 3 || index == 7 || index == 11
        shifted_set_3 = @characters.rotate(@d_shift)
        new_char_3 = shifted_set_3[@characters.index(letter)]
        encrypted_message << new_char_3
      end
    end
    encrypt_hash = {
      encryption: encrypted_message,
      key: key,
      date: date
    }
    return encrypt_hash
  end
end
