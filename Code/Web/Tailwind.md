# Classes
``` css
/* ===============================
   Layout
   =============================== */
container /* responsive centered container */
box-border box-content /* box-sizing */
block inline inline-block flex inline-flex grid hidden
float-left float-right float-none
clear-left clear-right clear-both clear-none
overflow-auto overflow-hidden overflow-visible overflow-scroll
z-0 z-10 z-20 z-30 z-40 z-50
order-first order-last order-1 order-2 order-3

/* ===============================
   Flexbox & Grid
   =============================== */
flex inline-flex
flex-row flex-col
flex-wrap flex-nowrap flex-wrap-reverse
items-start items-center items-end items-stretch
justify-start justify-center justify-end justify-between justify-around justify-evenly
gap-0 gap-1 gap-2 gap-4 gap-8
grid grid-cols-1 grid-cols-2 grid-cols-3 ... grid-cols-12
grid-rows-1 grid-rows-2 ...
col-span-1 col-span-2 ... row-span-1 row-span-2 ...
place-items-start place-items-center place-items-end place-items-stretch

/* ===============================
   Spacing
   =============================== */
m-0 m-1 m-2 ... m-64          /* margin */
mt-0 mt-1 ... mb-64           /* margin-top, bottom etc */
mx-0 mx-1 ... py-64           /* x / y axis spacing */
p-0 p-1 p-2 ... p-64          /* padding */
px-0 px-1 ... py-64
space-x-1 space-x-2 space-y-1 space-y-2

/* ===============================
   Sizing
   =============================== */
w-0 w-1 w-2 ... w-full w-screen
min-w-0 min-w-full
max-w-xs max-w-sm ... max-w-7xl max-w-full
h-0 h-1 h-2 ... h-full h-screen
min-h-0 min-h-full
max-h-0 max-h-full
aspect-w-1 aspect-h-1 ... aspect-w-16 aspect-h-16

/* ===============================
   Typography
   =============================== */
text-xs text-sm text-base text-lg text-xl text-2xl ... text-9xl
font-sans font-serif font-mono
font-thin font-light font-normal font-medium font-semibold font-bold font-extrabold font-black
tracking-tight tracking-normal tracking-wide
leading-none leading-tight leading-snug leading-normal leading-relaxed leading-loose
text-left text-center text-right text-justify
text-gray-50 text-gray-100 ... text-gray-900
uppercase lowercase capitalize normal-case
truncate overflow-ellipsis break-words

/* ===============================
   Backgrounds
   =============================== */
bg-transparent bg-black bg-white bg-gray-50 ... bg-gray-900
bg-red-50 ... bg-red-900
bg-opacity-0 ... bg-opacity-100
bg-cover bg-contain bg-auto bg-fixed bg-local bg-scroll
bg-center bg-top bg-bottom bg-left bg-right
bg-gradient-to-t bg-gradient-to-r bg-gradient-to-b bg-gradient-to-l
from-gray-500 via-gray-300 to-red-500

/* ===============================
   Borders
   =============================== */
border border-0 border-2 ... border-8
border-t border-r border-b border-l
border-gray-50 ... border-gray-900
border-solid border-dashed border-dotted border-double border-none
rounded-none rounded-sm rounded-md rounded-lg rounded-xl rounded-2xl rounded-3xl rounded-full
rounded-t rounded-b rounded-l rounded-r rounded-tr ...

/* ===============================
   Effects
   =============================== */
shadow shadow-sm shadow-md shadow-lg shadow-xl shadow-2xl shadow-inner shadow-none
opacity-0 ... opacity-100
mix-blend-normal multiply screen overlay darken lighten
filter blur grayscale sepia invert saturate hue-rotate
backdrop-blur backdrop-brightness backdrop-contrast

/* ===============================
   Interactivity
   =============================== */
cursor-auto cursor-pointer cursor-default cursor-text cursor-move cursor-not-allowed
resize resize-none resize-x resize-y
select-none select-text select-all select-auto
pointer-events-none pointer-events-auto

/* ===============================
   Transitions & Animations
   =============================== */
transition transition-none transition-all transition-colors transition-opacity transition-shadow transition-transform
duration-75 duration-100 ... duration-1000
ease-linear ease-in ease-out ease-in-out
delay-75 delay-100 ... delay-1000
animate-spin animate-ping animate-pulse animate-bounce animate-none

/* ===============================
   Positioning
   =============================== */
static relative absolute fixed sticky
inset-0 inset-x-0 inset-y-0 top-0 right-0 bottom-0 left-0
top-auto bottom-auto left-auto right-auto

/* ===============================
   Miscellaneous
   =============================== */
overflow-clip
list-none list-disc list-decimal list-inside list-outside
break-normal break-words break-all
ring ring-0 ring-1 ... ring-8
ring-offset-0 ... ring-offset-8
ring-opacity-0 ... ring-opacity-100
ring-color-gray-50 ... ring-color-gray-900
```
### Media Queries
``` js
 sm // @media (width >= 640px)
 md // @media (width >= 768px)
 lg // @media (width >= 1024px)
 xl // @media (width >= 1280px)
2xl // @media (width >= 1536px)
```
# Install
### Vite
``` bash
npm install -D @tailwindcss/vite
```
`vite.config.js`
``` js
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react(), tailwindcss()],
})
```
`index.css`
``` css
@import "tailwindcss";
```
### Manual
``` bash
npm install -D tailwindcss
# post processes @tailwind stuff in CSS 
npm install -D postcss
# autoprefixes browser dependent CSS properties (-webkit-, -moz-)
# example: `display: flex == -webkit-box` for older Safari versions
npm install -D autoprefixer
# init tailwind.config.js and postcss.config.js
npx tailwindcss init -p
```
`tailwind.config.js`
``` js
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
```
`index.css` import tailwind base styles, component/utility classes
``` css
@tailwind base;
@tailwind components;
@tailwind utilities;
```
