require './lib/enigma.rb'

enigma = Enigma.new
message = File.open(ARGV[0])
encryption = enigma.encrypt(message.read.chop)
new_file = File.open(ARGV[1], "w")
new_file.write(encryption[:encryption])

print "Created '#{ARGV[1]}' with the key #{enigma.random_number} and date #{enigma.six_digit_date}\n"
