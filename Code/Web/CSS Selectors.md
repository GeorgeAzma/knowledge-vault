### Basic
| Selector | Example     | Selects          |
| -------- | ----------- | ---------------- |
| `elem`   | `elem`      | `<elem>`         |
| `#id`    | `#my-id`    | `id=my-id`       |
| `*`      | `*`         | `*`              |
| `.class` | `.my-class` | `class=my-class` |
### Selectors

| Selector       | Example           | Selects All Elements With                            |
| -------------- | ----------------- | ---------------------------------------------------- |
| `attr`         | `[title]`         | `title` attribute                                    |
| `attr=val`     | `[title="hello"]` | `title="hello"`                                      |
| `attr~=val`    | `[title~="hel"]`  | `title` containing `hel`                             |
| `attr`\|`=val` | `[title="he"]`    | `title` starting with `he`                           |
| `attr^=val`    | `[title^="he"]`   | `title` starting with `he`<br>but not `title=he`     |
| `attr$=val`    | `[title$=lo]`     | `title` ending with `lo`                             |
| `attr*=val`    | `[title*=ell]`    | `title` containing `ell`                             |
| `&`            | `& div`           | style `div` inside base<br>style, avoids duplication |

### Combinators
| Selector | Example   | Selects                    |
| -------- | --------- | -------------------------- |
| `>`      | `div > a` | all `div` children `a`     |
| ` `      | `div a`   | direct `div` child `a`     |
| \|       | `ns`\|`a` | `a` in `ns` namespace      |
| `+`      | `div + a` | first `a` after `div`      |
| `,`      | `div, a`  | all `div` and `a`          |
| `~`      | `div ~ a` | all `a` preceeded by `div` |
### [[CSS Pseudo-Classes]]