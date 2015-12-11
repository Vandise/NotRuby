# Compile: rex tokens.rex -o lexer.rb

class Lexer

macro
  BLANK       [\ \t]+

rule
  {BLANK}     #skip whitespace
  \#.*$       #skip comments
  
  \d+         { [:NUMBER, text.to_i] }
  \"[^"]*\"   { [:STRING, text[1..-2]] }  #strip enclosing quotes
  \n+         { [:NEWLINE, text] }
  
  #
  #   keywords
  #
  
  end           { [:END, text] }
  def           { [:DEF, text] } 
  class         { [:CLASS, text] } 
  if            { [:IF, text] }
  else          { [:ELSE, text] }
  
  #
  #   literals
  #
  
  true         { [:TRUE, text] }
  false        { [:FALSE, text] }
  nil          { [:NIL, text] }
  
  #
  #   Identifiers
  #
  
  [a-z]\w*    { [:IDENTIFIER, text] }
  [A-Z]\w*    { [:CONSTANT, text] }
  
  #
  #   long operators
  #
  
  &&          { [text, text] }
  \|\|        { [text, text] }
  ==          { [text, text] }
  !=          { [text, text] }
  <=          { [text, text] }
  >=          { [text, text] }
  
  
  #
  #   all (operators)
  #     + - ( ) . *
  #
  
  .           { [text, text] }
  
inner
  def run(code)
    scan_setup(code)
    tokens = []
    while token = next_token
      tokens << token
    end
    tokens
  end
end