require 'Date'
require './lib/modules/keys'
require './lib/modules/offsets'
require './lib/shifts'
require 'pry'

class Enigma

  def initialize
    @shifts = Shifts.new
    @encrypt_helper = EncryptHelper.new
    @decrypt_helper = DecryptHelper.new
  end

  def encrypt(message, key = random_number, date = six_digit_date)
    @encrypt_helper.encryption(message, key, date)
  end

  def decrypt(message, key = @random_number, date = six_digit_date)
    @decrypt_helper.decryption(message, key, date)
  end
end
