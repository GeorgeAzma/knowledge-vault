`package.json`
``` json
"scripts": {
    "deploy": "npm run build && npx gh-pages -d build"
}
``` 
- add `gh-pages` branch
``` bash
git checkout --orphan gh-pages
git rm -rf .
git commit --allow-empty -m "Initial empty gh-pages branch"
git push origin gh-pages
```
- `git checkout main`
- `Repo -> GitHub Pages -> Enable`, branch `gh-pages`
- select `gh-pages` branch for deployment
- `npm run deploy`
### Svelte
`svelte.config.js`
``` js
kit: {
    paths: { base: '/<repo-name>' }
}
```
### Vite
``` js
export default defineConfig({
  build: {
    outDir: 'build'
  },
  base: '/<repo-name>',
  // other configs
})
```
