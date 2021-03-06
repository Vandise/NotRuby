# Represents a method defined in the runtime.
class RMethod
  def initialize(params, body_node)
    @params = params
    @body_node = body_node
  end
  
  def call(receiver, arguments)
    # Create a context of evaluation in which the method will execute.
    context = Context.new(receiver) # self = receiver
    
    # Assign arguments to local variables
    # method(1)
    # def method(a)
    #   (a = 1)
    # end
    @params.each_with_index do |param, index|
      context.locals[param] = arguments[index]
    end
    
    @body_node.eval(context)
  end
end