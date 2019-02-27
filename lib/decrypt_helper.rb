class DecryptHelper

  def initialize
    @shifts = Shifts.new
  end

  def decryption(message, key = random_number, date = six_digit_date)
    decrypted_message = ""
    @shifts.create_shifts(key, date)
    @shifts.split_string(message).map.with_index do |letter, index|
      if @shifts.characters.include?(letter)
        if index == 0 || index % 4 == 0
          decrypted_message << @shifts.neg_shift_0(letter)
        elsif index == 1 || index % 4 == 1
          decrypted_message << @shifts.neg_shift_1(letter)
        elsif index == 2 || index % 4 == 2
          decrypted_message << @shifts.neg_shift_2(letter)
        elsif index == 3 || index % 4 == 3
          decrypted_message << @shifts.neg_shift_3(letter)
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
