module Keys

  def random_number_generator
    @random_number = rand(0..99999).to_s.rjust(5, '0')
  end

  def a_key(key)
    key[0..1]
  end

  def b_key(key)
    key[1..2]
  end

  def c_key(key)
    key[2..3]
  end

  def d_key(key)
    key[2..3]
  end
end
