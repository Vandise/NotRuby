# Evaluation Context
#
# - locals        => holds local variables
# - current_self  => the object on which methods with no recievers are called (ie print = current_self.print)
# - current_class => the class on which methods are defined with the def keyword
#
class Context
  attr_reader :locals, :current_self, :current_class

  def initialize(current_self, current_class=current_self.runtime_class)
    @locals = {}
    @current_self  = current_self
    @current_class = current_class
  end
end