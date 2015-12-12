# Inheriting from Struct.new is the same as:
#
# class Nodes
#   attr_accessor :nodes
#
#   def initialize(nodes)
#     @nodes = nodes
#   end
#
#   def ==(other)
#     self.class == other.class && @nodes == other.nodes
#   end
#
# end
#
class Nodes < Struct.new(:nodes)
  def <<(node)
    nodes << node
    self
  end
end

class LiteralNode < Struct.new(:value); end
class NumberNode < LiteralNode; end
class StringNode < LiteralNode; end

class TrueNode < LiteralNode
  def initalize()
    super(true)
  end
end

class FalseNode < LiteralNode
  def initialize
    super(false)
  end
end

class NilNode < LiteralNode
  def initialize
    super(nil)
  end
end

# Node of a method call. Can take any of these forms:
#
#   method( arg1, arg2 )
#   reciever.method
#   reciever.method( arg1, arg2 )
#
class CallNode < Struct.new(:receiver_node, :method, :argument_nodes); end

# Get/Setting the value of a local variable
class SetLocalNode < Struct.new(:name, :value_node); end
class GetLocalNode < Struct.new(:name); end

# Getting the value of a constant
class GetConstantNode < Struct.new(:name); end

# Method Declarations
class DefNode < Struct.new(:name, :params, :body_node); end

# Class Definition
class ClassNode < Struct.new(:name, :body_node); end

#
# Control Structures
#

class IfNode < Struct.new(:condition_node, :body_node, :else_body_node); end
class WhileNode  < Struct.new(:condition_node, :body_node); end