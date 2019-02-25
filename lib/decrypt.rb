require './lib/enigma.rb'
require 'pry'

enigma = Enigma.new
encrypted_text = File.open(ARGV[0])
encryption = enigma.encrypt(encrypted_text.read.chop)
new_file = File.open(ARGV[1], "w")
new_file.write(encryption[:encryption])

print "Created '#{ARGV[1]}' with the key #{enigma.random_number} and date #{enigma.todays_date}\n"
