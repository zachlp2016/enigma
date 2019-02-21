module Keys

  def random_number
    rand 100000
  end

  def a_key
    a_key = []
    random_number.to_s.chars.each_with_index do |char|
      pry
    end
  end

  # The keys are created by generating a random five digit number, like 02715, and splitting it up like so:
  #
  # A key: first two digits (02)
  # B key: second and third digits (27)
  # C key: third and fourth digits (71)
  # D key: fourth and fifth digits (15)

end
