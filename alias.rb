class MyСlass
  def self.the_same(method_name, alias_name)
    define_method alias_name do
      public_send(method_name)
    end
  end
end

class My < MyСlass
  the_same :a, :b

  def a
    puts "B"
  end

  def foo
    puts "foo"
  end
end
