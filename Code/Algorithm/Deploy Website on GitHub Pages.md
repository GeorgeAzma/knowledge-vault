`package.json`
``` json
"scripts": {
    "deploy": "npm run build && npx gh-pages -d build -t true"
}
``` 
- `Repo -> GitHub Pages -> Enable`, branch `gh-pages`
`svelte.config.js`
``` js
kit: {
    paths: { base: '/<repo-name>' }
}
```
- `npm run deploy`
