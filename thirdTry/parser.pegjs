// Simple handlebars parser
// A First try by Brad Barrows

Expression "expression"
  = CommandSurroundedByLogicORCommandOrString*
  
CommandSurroundedByLogicORCommandOrString "commandsurroundedbylogic-comand-string"
  = CommandSurroundedByLogic
  / Command
  / String
  
CommandOrString 
  = Command
  / String  

CommandSurroundedByLogic "commandsurroundedbylogic"
  = _ logic:InitialCommandTypeLogic _ cmd:CommandOrString _ EndCommandTypeLogic _ {
  	return "CommandSurroundedByLogic -> " + logic + " command inside -> " + cmd;
  }

SExpressionOrStringWoCommandNameOrSpace "sexpr-stringwocommandorspace"
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
  = "{{" _ expr:SExpressionOrStringWoCommandNameOrSpace _ "}}" { return "Command: " + expr; }

InitialCommandTypeLogic "initialcommandtypelogic"
  = "{{" _ expr:CommandTypeLogic _ "}}" { return "Initial Logic Command: " + expr; }

EndCommandTypeLogic "endcommandtypelogic"
  = "{{" _ expr:CommandTypeEndLogic _ "}}" { return "End Logic Command"; }


// What about adding a global eval command to support bad programming habits? Call it 
// EvalCommand
// = "!eval"

CommandTypeLogic "commandtypelogic"
  = "#" expr:LogicString { return "Logic(" + expr + ")"; }
  
CommandTypeEndLogic "commandtypeendlogic"
  = "#end" { return "End Logic"; }  

LogicString "logicstring"
  = "if"
  / "unless"
//  = (if|unless|else)* { return "Logic(" + text() + ")"; }

StringWoCommandOrSpace "stringwocommandorspace"
  = [^{}\(\) \t\n\r]+ { return "strwocmdsp:" + text(); }
  
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


