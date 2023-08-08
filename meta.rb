class NewModule
  def self.my_attr_accessor(*attributes)
    attributes.each do |attribute|
      define_method attribute do
        self.class.attr_reader(attribute)
      end

      define_method("#{attribute}=") do |params|
        self.class.attr_writer(attribute)
      end
    end
  end

  def self.another_attr_accessor(*attrs)
    attrs.each do|attr|
      define_method attr do
        instance_variable_get("@#{attr}")
      end

      define_method "#{attr}=" do |param|
        instance_variable_set("@#{attr}", param)
      end
    end
  end
end

class Meta < NewModule
  attr_accessor :name
  my_attr_accessor :key
  another_attr_accessor :val
end
