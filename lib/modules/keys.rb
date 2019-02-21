class Keys

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
end
