class RMethod

  def initialize(params, body_node)
    @params = params
    @body_node = body_node
  end

  def call(reciever, arguments)
    context = Context.new(reciever)

    @params.each do |param, index|
      context.locals[param] = arguments[index]
    end

    @body_node.eval(context)
  end
end