const { parse, SyntaxError } = require('./parser.js');

const codeToParse = `{{#if somevar}} {{#if somevar2}} {{#end}} asdf {{#end}}`;

console.log(parse(codeToParse));