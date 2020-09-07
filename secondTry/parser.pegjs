// Simple handlebars parser
// A First try by Brad Barrows

Expression
  = CommandOrStringWoCommand*
  
CommandOrStringWoCommand
  = String
  / Command
  
SExpressionOrStringWoCommandOrSpace
  = StringWoCommandOrSpace
  / SExpression  
  
SExpression "sexp"
  = expr:("(" _ StringWoCommandOrSpace (_ StringWoCommandOrSpace)* _ ")")* { 
    const actualExpr = expr[0];
    const func = actualExpr[2];
	const args = actualExpr[3].map(a => a[1]);
    return "SExpr name: " + func + " args: " + args; 
  }  
  
Command "command"
  = "{{" _ expr:SExpressionOrStringWoCommandOrSpace _ "}}" { return "Command: " + expr; }
  
StringWoCommandOrSpace "string"
  = [^{}\(\) \t\n\r]+ { return text(); }
  
StringWoCommand "string"
  = [^{}\(\)]+ { return text(); }

StringWoSpace "string"
  = [^ \t\n\r]+ { return text(); }
  
String "string"
  = [^{}]+ { return text(); }

Integer "integer"
  = _ [0-9]+ { return parseInt(text(), 10); }

_ "whitespace"
  = [ \t\n\r]*


