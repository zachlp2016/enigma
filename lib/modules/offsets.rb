module Offsets

  def master_offset(date = six_digit_date)
    master_offset = date.to_i * date.to_i
    master_offset = master_offset.to_s[-4..-1].split.join
  end

  def six_digit_date
    two_digit_day + two_digit_month + two_digit_year
  end

  def todays_date
    Date.today
  end

  def two_digit_day
    todays_date.day.to_s.rjust(2, '0')
  end

  def two_digit_month
    todays_date.month.to_s.rjust(2, '0')
  end

  def two_digit_year
    todays_date.year.to_s[-2..-1]
  end

  def a_offset(date)
    master_offset(date)[0].to_i
  end

  def b_offset(date)
    master_offset(date)[1].to_i
  end

  def c_offset(date)
    master_offset(date)[2].to_i
  end

  def d_offset(date)
    master_offset(date)[2].to_i
  end
end
