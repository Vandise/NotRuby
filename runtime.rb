require "runtime/object"
require "runtime/class"
require "runtime/method"
require "runtime/context"

Constants = {}
Constants["Class"] = RClass.new
Constants["Class"].runtime_class = Constants["Class"]
# => Class.class = Class

Constants["Object"] = RClass.new

Constants["Number"] = RClass.new
Constants["String"] = RClass.new

main = Constants["Object"].new
RootContext = Context.new(main) # self => main


Constants["TrueClass"] = RClass.new
Constants["FalseClass"] = RClass.new
Constants["NilClass"] = RClass.new

Constants["true"] = Constants["TrueClass"].new_with_value(true)
Constants["false"] = Constants["FalseClass"].new_with_value(false)
Constants["nil"] = Constants["NilClass"].new_with_value(nil)


# Object.new
Constants["Class"].def :new do |reciever, arguments|
  reciever.new
end

# print("hi")
Constants["Object"].def :print do |reciever, arguments|
  puts arguments.first.ruby_value
  Constants["nil"]
end

Constants["Number"]. def :+ do |reciever, arguments|
  a = reciever.ruby_value
  b = arguments.first.ruby_value
  Constants["Number"].new_with_value(a + b)
end