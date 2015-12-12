class RClass < RObject
  attr_reader :runtime_methods

  def initialize
    @runtime_methods = {}
    @runtime_class = Constants["Class"]
  end

  def lookup(method_name)
    @runtime_methods[method_name] || raise("Call to undefined method #{method_name}")
  end

  def def(name, &block)
    @runtime_methods[name.to_s] = block
  end

  def new
    RObject.new(self)
  end

  def new_with_value(value)
    RObject.new(self, value)
  end
end