module Offsets

  def master_offset(date)
    master_offset = date.to_i * date.to_i
    master_offset = master_offset.to_s[-4..-1].split.join
    binding.pry
  end

end
