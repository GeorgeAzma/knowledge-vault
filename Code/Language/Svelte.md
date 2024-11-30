### Initialize Project
- `npm create svelte`

### Deploy on GitHub Pages
- Upload project to GitHub
- Add this to `package.json`: 
	`"deploy": "npm run build && npx gh-pages -d build -t true"`
- Make sure to use @sveltejs/adapter-static
	- `npm install --save --save-exact @sveltejs/adapter-static`
	- Or just add it to `"dependencies": {}` and do `npm i`
- If using project as a GitHub page add to `svelte.config.js`:
	`export default { kit: { paths: {base: '/lava-lamp'} } }`

youtu.be/H1eEFfAkIik
