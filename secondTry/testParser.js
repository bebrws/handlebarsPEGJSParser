const { parse, SyntaxError } = require('./parser.js');

const codeToParse = `before a expr  {{(sdf arg1 arg2)}} {{(noArgsFunc)}} {{ASDF}} after the`;

console.log(parse(codeToParse));