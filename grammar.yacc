#Compile: racc grammar.yacc -o parser.rb

class Parser

#
# Tokens found in the lexer
#

token IF
token ELSE
token DEF
token CLASS
token NEWLINE
token NUMBER
token STRING
token TRUE FALSE NIL
token IDENTIFIER
token CONSTANT
token END

rule
  Expressions:
    Expression                            { result = [ val[0] ] }
  | Expressions NEWLINE Expression        { result = val[0] << val[2]  }
  ;


  Expression:
    NUMBER              { result = val[0] }
  | STRING              { result = val[0] }
  ;

end

---- header
  require "lexer"
  require "nodes"

---- inner
  def parse(code, show_tokens=false)
    @tokens = Lexer.new.run(code)
    p @tokens if show_tokens
    do_parse
  end

  def next_token
    @tokens.shift
  end