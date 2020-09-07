// Simple handlebars parser
// A First try by Brad Barrows

Expression "expression"
  = Nodes
  
Nodes
  = Node _ Nodes*
  / Node
  
Node "commandsurroundedbylogic-comand-string"
  = CommandSurroundedByLogic
  / Command
  / String
  
CommandOrString 
  = Command
  / String  

CommandSurroundedByLogic "commandsurroundedbylogic"
  = logic:InitialCommandTypeLogic _ innercmds:Nodes* _ EndCommandTypeLogic {
  	return "CommandSurroundedByLogic -> " + logic + " command inside -> " + innercmds;
  }

SExpressionOrStringWoCommandNameOrSpace "sexpr-stringwocommandorspace"
  = StringWoCommandOrSpace
  / SExpression  
  
SExpression "sexp"
  = expr:("(" _ StringWoCommandOrSpace (_ StringWoCommandOrSpace)* _ ")") { 
    const actualExpr = expr;
    const func = actualExpr[2];
	const args = actualExpr[3].map(a => a[1]);
    return "SExpr name: " + func + " args: " + args; 
  }
  
Command "command"
  = "{{" _ expr:SExpressionOrStringWoCommandNameOrSpace _ "}}" { return "Command: " + expr; }

InitialCommandTypeLogic "initialcommandtypelogic"
  = "{{" _ expr:CommandTypeLogic _ SExpressionOrStringWoCommandNameOrSpace _ "}}" { return "Initial Logic Command: " + expr; }

EndCommandTypeLogic "endcommandtypelogic"
  = "{{" _ expr:CommandTypeEndLogic _ "}}" { return "End Logic Command"; }

CommandTypeLogic "commandtypelogic"
  = "#" expr:LogicString { return "Logic(" + expr + ")"; }
  
CommandTypeEndLogic "commandtypeendlogic"
  = "#end" { return "End Logic"; }  

LogicString "logicstring"
  = "if"
  / "unless"

StringWoCommandOrSpace "stringwocommandorspace"
  = [^#{}\(\) \t\n\r]+ { return "strwocmdsp:" + text(); }
  
StringWoCommand "stringwocommand"
  = [^{}\(\)]+ { return "strwocmd:" + text(); }

StringWoSpace "stringwospace"
  = [^ \t\n\r]+ { return "strwosp:" + text(); }
  
String "string"
  = [^{}]+ { return "str:" + text(); }

Integer "integer"
  = _ [0-9]+ { return parseInt(text(), 10); }

_ "whitespace"
  = [ \t\n\r]*


