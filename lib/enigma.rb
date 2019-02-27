require 'Date'
require './lib/modules/keys'
require './lib/modules/offsets'
require './lib/encrypt_helper'
require './lib/decrypt_helper'
require './lib/shifts'
require 'pry'

class Enigma

  attr_reader :shifts

  def initialize
    @shifts = Shifts.new
    @encrypt_helper = EncryptHelper.new
    @decrypt_helper = DecryptHelper.new
  end

  def encrypt(message, key = @shifts.random_number, date = @shifts.six_digit_date)
    @encrypt_helper.encryption(message, key, date)
  end

  def decrypt(message, key = @shifts.random_number, date = @shifts.six_digit_date)
    @decrypt_helper.decryption(message, key, date)
  end
end
