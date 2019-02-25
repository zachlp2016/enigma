require './lib/enigma.rb'
require 'pry'

enigma = Enigma.new
message = File.open(ARGV[0])
encryption = enigma.encrypt(message.read.chop)
new_file = File.open(ARGV[1], "w")
new_file.write(encryption[:encryption])

print "Created '#{ARGV[1]}' with the key #{enigma.random_number} and date #{enigma.todays_date}\n"




# create a Runner file called encrypt.rb that takes two command line arguments.
# The first is an existing file that contains a message to encrypt. The
# second is a file where your program should write the encrypted message.
# In addition to writing the encrypted message to the file, your program
# should output to the screen the file it wrote to, the key and the date.
