const { parse, SyntaxError } = require('./parser.js');

const codeToParse = `asdf {{ASDFDS}} {{#if}} {{asdf}} asdf {{#end}}`;

console.log(parse(codeToParse));