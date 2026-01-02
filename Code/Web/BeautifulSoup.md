``` bash
pip install beautifulsoup4
pip install lxml # for incomplete string HTML (optional)
```

``` python
from bs4 import BeautifulSoup

html = "<div><p class='msg'>Hello</p></div>"
soup = BeautifulSoup(html, "lxml")

print(soup.p.text)         # Hello
print(soup.find("p").text) # Hello
```

``` python
soup = BeautifulSoup(html_str, "lxml") # lxml = html from string (no html header)

# from file
with open("page.html", "r", encoding="utf-8") as f:
    soup = BeautifulSoup(f, "html.parser")
```
### Find Elements
``` python
soup.find("div") # finds 1st divv
soup.find(id="search_btn")
soup.find(class_="ui-button")
soup.find("button", {"type": "submit"})
soup.find_all("li")
soup.find_all("a", limit=5)
```

``` python
# CSS Selectors
soup.select("#search_btn")
soup.select("button.ui-button")
soup.select("li > button")
soup.select("span.ui-button-text")

# Extract Text
tag = soup.find("span", class_="ui-button-text")
tag.text
tag.get_text()
tag.get_text(strip=True)

# Extract Attributes
btn = soup.find("button")
btn["id"]
btn.get("type")
btn.get("data-x")
```
### Modify HTML
``` python
p = soup.find("p")
p.string = "Updated text"

div = soup.new_tag("div", id="new")
div.string = "hello"
soup.body.append(div)

# Remove Elements
tag = soup.find("script")
tag.decompose()
tag.extract()
```
### Common Patterns
``` python
# table → JSON
rows = []
for tr in soup.select("table tr"):
    tds = [td.get_text(strip=True) for td in tr.select("td")]
    if tds:
        rows.append(tds)

# grab links
links = [a["href"] for a in soup.select("a[href]")]

# button text
text = soup.select_one("button#search_btn .ui-button-text").text


### Real-World Web Request
import requests
from bs4 import BeautifulSoup

url = "https://example.com"
html = requests.get(url).text

soup = BeautifulSoup(html, "lxml")

title = soup.title.text
items = soup.select("li.item > span.name")

print(title)
for i in items:
    print(i.text)
```
### Useful Functions
``` python
soup.prettify()

element.name
element.attrs
element.parent
element.find_next()
element.find_previous()
element.find_all_next("span")
```