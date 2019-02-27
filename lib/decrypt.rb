require './lib/enigma.rb'
require 'pry'

enigma = Enigma.new
encrypted_text = File.open(ARGV[0])
decryption = enigma.decrypt(encrypted_text.read, ARGV[2], ARGV[3])
new_file = File.open(ARGV[1], "w")
new_file.write(decryption[:decryption])

print "Created '#{ARGV[1]}' with the key #{enigma.shifts.random_number} and date #{enigma.shifts.six_digit_date}\n"
