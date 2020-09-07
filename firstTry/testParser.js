const { parse, SyntaxError } = require('./parser.js');

const codeToParse = `asdf {{asdf}} sadf {{asdf}}`;

console.log(parse(codeToParse));