``` python
* # 0+ times
+ # one or more
? # once or none
. # any char except line break
^ # starts with
$ # ends with

'\d' # digit
'\D' # not digit
'\w' # word
'\W' # not word

'\s' # whitespace
'\S' # not whitespace
'\t' # tab
'\n' # newline
'\R' # one line break
'\h' # horizontal whitespace
'\H' # not horizontal whitespace

(abc) # group
[abc] # a | b | c
a | b # a or b
[a-b] # a to b

{n}   # n times
{n,}  # n+ times
{n,m} # n-m times

(ab)(cd)\N # if N=1: (ab) elif N=2: (cd)
\xN        # hexadecimal N

import re

text = "I have 7 bags of 42 apples"  

# searching
re.search(r'\d+', text).group() # 7
re.findall(r'\d+', text) # ['7', '42']
re.finditer(r'\d+', text) # ['7', '42'].iter()

re.split(r'[,;|]\s*', 'a,b; c|d') # ['a', 'b', 'c', 'd'] 

# substitution
re.sub(r'\d+', 'N', text) # 'I have N bags of N apples'
re.subn(r'\d+', 'N', text, 1) # ('I have N bags of 42 apples', 1 /* sub count */)

# matching
if re.match('\d+', 'ab31c'): # false (digit not at start)
    print('contains digit at start')

if re.fullmatch(r'\w+@\w+\.\w+', email):
    print('valid email')

pattern = re.compile('\d+') # Pattern()
pattern.findall("a1 b22") # ['1', '22']

# grouping
re.search(r'(?P<year>\d{4})-(?P<month>\d{2})', '2026-04')
m.group('year') # 2026

# flags
re.search(r'hello', 'HELLO', re.IGNORECASE | re.MULTILINE | re.DOTALL)

re.purge() # clear the regular expression cache
re.escape('a.b*c') # 'a\.b\*c' backslashes all non-alphanumerics
```