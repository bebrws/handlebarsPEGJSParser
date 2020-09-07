const { parse, SyntaxError } = require('./parser.js');

const codeToParse = `{{#if somevar}} {{(func1 arg2 arg2)}} {{#if somevar2}} {{#end}} innerstring {{somevar3}} {{#end}}`;

console.log(parse(codeToParse));