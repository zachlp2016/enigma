module Keys

  def random_number
    rand(0..99999).to_s.rjust(5, '0')
  end

  def a_key
    random_number[0..1]
  end

  def b_key
    random_number[1..2]
  end

  def c_key
    random_number[2..3]
  end

  def d_key
    random_number[2..3]
  end
end
