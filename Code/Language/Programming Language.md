### Components
#### Lexer
``` rust
fn lex(source_code) -> [Token];
lexer(let x = 0;) -> [LET, IDENT, EQ, NUM]
// tokens have source location like [start, end, line, column]
```

#### Parser
``` rust
fn parse(tokens) -> AST // Abstract Syntax Tree
parser([LET, IDENT, EQ, NUM]) -> Op(Id(x), [(Eq, Int(5))])
```
#### Interpreter
``` rust
// evaluates/executes AST
fn interpret(ast);
```
