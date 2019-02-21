module Keys

  def random_number
    arr = []
    5.times do |i|
      arr << rand(0..9)
    end
    return arr.join.to_i
  end

  def a_key
    random_number.to_s[0..1].to_i
  end

  def b_key
    random_number.to_s[1..2].to_i
  end

  def c_key
    random_number.to_s[2..3].to_i
  end

  def d_key
    random_number.to_s[2..3].to_i
  end
  # The keys are created by generating a random five digit number, like 02715, and splitting it up like so:
  #
  # A key: first two digits (02)
  # B key: second and third digits (27)
  # C key: third and fourth digits (71)
  # D key: fourth and fifth digits (15)

end
