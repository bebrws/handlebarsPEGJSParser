// Simple handlebars parser
// A First try by Brad Barrows

Expression
  = StringOrCommand*
  
StringOrCommand
  = String
  / Command
  
Command
  = "{{" _ expr:String _ "}}" { return "Command: " + expr; }
  
String "string"
  = [^{}]+ { return text(); }

Integer "integer"
  = _ [0-9]+ { return parseInt(text(), 10); }

_ "whitespace"
  = [ \t\n\r]*


