# Parsing a handlebars like grammer with PEG.js

I have worked with PEG.js before and really enjoyed it. After reading and working another project with was parsing it's own language I wanted to play around with parsing and grammar files a little.

My attempt at some quick practice projects around parsing a handlebars like syntax using PEG.js

A great resource is this [odata Peg.js parser](https://github.com/auth0/node-odata-parser/blob/master/src/odata.pegjs)

This handlebar parser is returning some strings I was using for debugging right now which may be confusing but the grammar is easy enough to read I think.

And it can be easily modified to do something useful.

So far..

It handles s expression style function calls: {{(function arg1 arg2)}}

Variables: {{somevar}}

Logic statements if and unless: {{#if}} {{#end}}

It ignores and can just logout any other text




To try it out:
```
cd fifthTry
npm install
npm run start
```