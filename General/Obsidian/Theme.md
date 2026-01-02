- modifies code highlighting
- makes backgrounds darker
- removes tab area
- removes borders
- adds tier colors
``` css
.theme-dark {
    --code-size: var(--font-smaller);
    --code-background: #1f1f1f;
    --code-normal: rgb(200, 200, 200);
    --code-comment: var(--text-faint);
    --code-function: rgb(220, 220, 170);
    --code-important: var(--color-orange);
    --code-keyword: #C586C0;
    --code-property: rgb(140, 210, 255);
    --code-punctuation: var(--text-muted);
    --code-string: #CD8E74;
    --code-tag: rgb(90, 180, 255);
    --code-value: var(--color-purple);
    --background-primary: #181818;
    --background-secondary: #1f1f1f;
    --divider-width: 0px;
}

.workspace-tab-header-container,
.titlebar {
    display: hidden;
    opacity: 0%;
    height: 0px;
    width: 0px;
    padding: 0px;
    margin: 0px;
}

.suggestion-container,
.menu,
.prompt,
.modal,
.workspace {
    border-width: 0px !important;
}

.S-tier {
    color: #cc33ff;
}

.A-tier {
    color: #aaaaff;
}

.B-tier {
    color: #aaffff;
}

.C-tier {
    color: #55ff99;
}

.D-tier {
    color: #aaff77;
}

.E-tier {
    color: #ffff99;
}

.F-tier {
    color: #ff9999;
}

.tier {
    counter-reset: custom-counter;
    list-style-type: none;
}

.tier li {
    counter-increment: custom-counter;
    position: relative;
    padding-left: 14px;
}

.tier li::before {
    opacity: 40%;
    content: counter(custom-counter) " ";
    position: absolute;
    right: 100%;
    margin-right: -4px;
}
```