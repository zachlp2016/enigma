module Keys

  def random_number_generator
    @random_number = rand(0..99999).to_s.rjust(5, '0')
  end

  def a_key(key = @random_number)
    key[0..1]
  end

  def b_key(key = @random_number)
    key[1..2]
  end

  def c_key(key = @random_number)
    key[2..3]
  end

  def d_key(key = @random_number)
    key[3..4]
  end
end
