require './lib/enigma.rb'
require 'pry'

enigma = Enigma.new
command = ARGV
message = File.read('message.txt')
encryption = enigma.encrypt(message.chop)
new_file = File.write('encrypted.txt', encryption[:encryption])
binding.pry

print "Created  with the key #{new_enigma.random_number} and date #{new_enigma.todays_date}"




# Add a command line interface for encryption and decryption. You should
# create a Runner file called encrypt.rb that takes two command line arguments.
# The first is an existing file that contains a message to encrypt. The
# second is a file where your program should write the encrypted message.
# In addition to writing the encrypted message to the file, your program
# should output to the screen the file it wrote to, the key and the date.
