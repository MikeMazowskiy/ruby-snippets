class Array
  def map_2x(&block)
    self.map do |x|
      value = yield x
      value *= 2
      value
    end
  end

  def map_2x_ver_2(&block)
    self.map {  |x| (yield x) * 2 }
  end
end