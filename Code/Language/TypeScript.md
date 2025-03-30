### Via NPM
``` bash
npm i --save-dev typescript @types/node
touch tsconfig.json main.ts

# running

# via tsc
npx tsc # compile ts to js
node dist/main.js
node main.js

# via ts-node (skips ts->js compile, quick for dev)
npm i -g ts-node # global install
ts-node main.ts

# via tsx (even faster but skips type checking)
# (though vscode typechecks so no biggie)
npm i -g tsx # or npx tsx
tsx main.ts
```
`tsconfig.json` compiler options are not necessary
``` json
{
    "compilerOptions": {
        "target": "es6",
        "module": "commonjs",
        "strict": true,
        "esModuleInterop": true,
        "outDir": "dist"
    },
    "include": ["main.ts"]
}
```
### For HTML
uses `vite` for fast hot reloading
``` bash
npm create vite@latest <project-name>
cd <project-name>
npm i
touch index.html
npm run dev
```
- Add `<script type="module" src="/src/main.ts"></script>` to `index.html`
- Clean `App.ts` and delete other files in `src/`
