### Basic
| Selector | Example     | Selects          |
| -------- | ----------- | ---------------- |
| `elem`   | `elem`      | `<elem>`         |
| `#id`    | `#my-id`    | `id=my-id`       |
| `*`      | `*`         | `*`              |
| `.class` | `.my-class` | `class=my-class` |
### Selectors

| Selector       | Example           | Selects All Elements With              |
| -------------- | ----------------- | -------------------------------------- |
| `attr`         | `[title]`         | `title` attribute                      |
| `attr=val`     | `[title="hello"]` | `title == hello`                       |
| `attr~=val`    | `[title~="hel"]`  | `title.split().contains(hel)`          |
| `attr`\|`=val` | `[title="he"]`    | `title.starts_with(he)`                |
| `attr^=val`    | `[title^="he"]`   | `title != he && title.starts_with(he)` |
| `attr$=val`    | `[title$=lo]`     | `title.ends_with(lo)`                  |
| `attr*=val`    | `[title*=hello]`  | `title.contains(hello)`                |
| `&`            | `& div`           | style `div` inside base class          |

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
