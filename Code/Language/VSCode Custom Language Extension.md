``` bash
mkdir vscode-mylang
```
```
vscode-mylang/
|- src/myCode.js
|- syntaxes/mylang.tmLanguage.json
|- language-configuration.json
|- extension.js
|- icon.webp
|- install.bat
|- LICENSE.md
|- package.json
|+ mylang-0.0.1.vsix # created by below
```
``` bash
npm install -g vsce
cd vscode-mylang
```
`install.bat`
``` bash
vsce package --allow-missing-repository && code --install-extension mylang-0.0.1.vsix
```
`package.json`
``` json
{
    "name": "shaz",
    "displayName": "Shaz",
    "description": "Syntax highlighting for Shaz",
    "version": "0.0.1",    
    "publisher": "Giorgi Azmaiparashvili",
    "icon": "icon.webp",
    "license": "MIT", // add LICENSE in root folder
    "repository": { "type": "git", "url": "github.com/GeorgeAzma/vscode-mylang" },
    "engines": {
      "vscode": "^1.80.0"
    },
    "activationEvents": [],
	"main": "./extension.js",
    "contributes": {
      "languages": [
        {
          "id": "shaz",
          "aliases": ["Shaz", "shaz"],
          "extensions": [".shaz"],
          "configuration": "./language-configuration.json"
        }
      ],
      "grammars": [
        {
          "language": "shaz",
          "scopeName": "source.shaz",
          "path": "./syntaxes/shaz.tmLanguage.json"
        }
      ]
    }
}
```
`language-configuration.json`
``` json
{
    "comments": {
      "lineComment": "#",
      "blockComment": ["/*", "*/"]
    },
    "brackets": [ ["{", "}"], ["[", "]"], ["(", ")"] ],
    "autoClosingPairs": [ 
      {"open": "{", "close": "}"}, 
      {"open": "[", "close": "]"}, 
      {"open": "(", "close": ")"} 
    ],
}
```
### Patterns
`syntaxes/mylang.tmLanguage.json`
``` json
{
  "scopeName": "source.mylang",
  "patterns": [
    {
      "name": "keyword.control.mylang",
      "match": "\\b(if|else|while|for|return|break|continue)\\b"
    },
    {
      "name": "constant.language.mylang",
      "match": "\\b(A|B|C|D|x|y|r|g|b)\\b"
    },
    {
      "name": "constant.numeric.mylang",
      "match": "\\b[0-9]+(?:\\.[0-9]*)?\\b"
    },
    {
      "name": "string.quoted.double.mylang",
      "match": "\"(.*?)\""
    },
    {
      "name": "comment.line.number-sign.mylang",
      "match": "#.*$"
    },
    {
      "name": "comment.block.mylang",
      "begin": "/\\*",
      "end": "\\*/",
      "patterns": [
        {
          "name": "comment.block.mylang",
          "match": "(.)"
        }
      ]
    },
    {
      "name": "variable.other.mylang",
      "match": "\\b[a-zA-Z_][a-zA-Z0-9_]*\\b"
    },
    {
      "name": "entity.name.function.mylang",
      "match": "\\b([a-zA-Z_][a-zA-Z0-9_]*)\\s*(?=\\()"
    },
    {
      "name": "keyword.operator.mylang",
      "match": "\\+|\\-|\\*|\\/|%|=|==|!=|<|>|<=|>=|&&|\\|\\|"
    },
    {
      "name": "punctuation.definition.mylang",
      "match": "[\\[\\]{}()]+"
    },
    {
      "name": "constant.character.mylang",
      "match": "[!@#$%^&*]"
    }
  ]
}
```
> [!tip] debug by pressing `F5` on `extension.js`
