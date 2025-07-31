``` rust
// input 42.1
{:.2} "42.10"
{:>6} "  42.1" // right align (6 chars total)
{:^6} " 42.1 " // center align (6 chars total)
{:06} "0042.1" // zero pad (6 chars total)
{:b} // binary
{:x} // lowercase hex
{:X} // uppercase hex
{:#X} // 0XFF hex
{:o} // octal
{:+} "+42.1" // always display sign
{:e} "4.21e1" // scientific notation
{:.>6} "..42.1" // fill with .
{:^#6} "#42.1#" // center with #
{a:<b$}, a = 1, b = 2 // set a=1, right align by b=2
```
