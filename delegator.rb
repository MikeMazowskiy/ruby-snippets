class Name
  def method_one
    puts "One"
  end

  def method_two
    puts 2
  end
end

class MyDelegator
  attr_accessor :object

  def initialize(object)
    self.object = object
  end

  private def method_missing(symbol, *args)
    object.send(symbol, *args)
  end

  def a
    puts "B"
  end
end


module MyModule
  def increase(scale)
    scale += 1000
  end

  def decrease(scale)
    scale -= 1000
  end
end

class Map
  include MyModule
  attr_reader :size, :scale

  METHODS = /\Ascale_(decrease|increase)\z/

  def initialize(size, scale)
    @size  = size
    @scale = scale
  end

  private

  def respond_to_missing?(method, _include_all)
    return true if METHODS.match(method.to_s)

    super
  end

  def method_missing(symbol, *args)
    if symbol.to_s =~ METHODS
      @scale = send  Regexp.last_match(1), @scale
    else
      super
    end
  end
end
