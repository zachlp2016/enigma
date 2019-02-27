require 'Date'
require './lib/modules/keys'
require './lib/modules/offsets'
require './lib/shifts'
require 'pry'

class EncryptHelper

  def initialize
    @shifts = Shifts.new
  end

  def encryption(message, key = random_number, date = six_digit_date)
    encrypted_message = ""
    @shifts.create_shifts(key, date)
    @shifts.split_string(message).map.with_index do |letter, index|
      if @shifts.characters.include?(letter)
        if index == 0 || index % 4 == 0
          encrypted_message << @shifts.shift_0(letter)
        elsif index == 1 || index % 4 == 1
          encrypted_message << @shifts.shift_1(letter)
        elsif index == 2 || index % 4 == 2
          encrypted_message << @shifts.shift_2(letter)
        elsif index == 3 || index % 4 == 3
          encrypted_message << @shifts.shift_3(letter)
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
end
