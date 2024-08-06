Add this to your `package.json` `"scripts": {}` field: 
	`"deploy": "npm run build && npx gh-pages -d build -t true"`
- Enable `GitHub Pages` from your repo settings and set branch to `gh-pages`
- In `svelte.config.js` file, `kit: {}` field add `paths: { base: '/<repo-name>' }` 
- `npm run deploy`
