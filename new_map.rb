class Array
  def map_2x(&block)
    self.map do |x|
      value = yield x
      value *= 2
      value
    end
  end
end