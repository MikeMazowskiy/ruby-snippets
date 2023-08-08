class Array
  def map_2x
    self.map do |x|
      value = yield x
      value *= 2
      value
    end
  end

  def map_2x_ver_2
    return self.map {  |x| (yield x) * 2 } if block_given?

    self.map {  |x| x * 2 }
  end
end