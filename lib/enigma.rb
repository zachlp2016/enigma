require 'Date'
require './lib/modules/keys'
require './lib/modules/offsets'
require './lib/modules/shifts'
require 'pry'

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
    encrypted_message = ""
    create_shifts(key, date)
    split_string(message).map.with_index do |letter, index|
      if @characters.include?(letter)
        if index == 0 || index % 4 == 0
          encrypted_message << shift_0(letter)
        elsif index == 1 || index % 4 == 1
          encrypted_message << shift_1(letter)
        elsif index == 2 || index % 4 == 2
          encrypted_message << shift_2(letter)
        elsif index == 3 || index % 4 == 3
          encrypted_message << shift_3(letter)
        end
      else
        encrypted_message << letter
      end
    end
    encrypted_info = {
      encryption: encrypted_message,
      key: key,
      date: date
    }
    return encrypted_info
  end

  def decrypt(message, key = @random_number, date = six_digit_date)
    decrypted_message = ""
    create_shifts(key, date)
    split_string(message).map.with_index do |letter, index|
      if @characters.include?(letter)
        if index == 0 || index % 4 == 0
          decrypted_message << neg_shift_0(letter)
        elsif index == 1 || index % 4 == 1
          decrypted_message << neg_shift_1(letter)
        elsif index == 2 || index % 4 == 2
          decrypted_message << neg_shift_2(letter)
        elsif index == 3 || index % 4 == 3
          decrypted_message << neg_shift_3(letter)
        else
          decrypted_message << letter
        end
      end
    end
    decrypted_info = {
      decryption: decrypted_message,
      key: key,
      date: date
    }
    return decrypted_info
  end
end
