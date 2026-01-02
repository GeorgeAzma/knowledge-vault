Browser automation https://playwright.dev/python/
### Sync
``` python
from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.chromium.launch()
    page = browser.new_page()
    page.goto("https://youtube.com")
    print(page.title()) # YouTube  
    browser.close()
```
### Async
``` python
import asyncio
from playwright.async_api import async_playwright

async def main():
    async with async_playwright() as p:
        browser = await p.chromium.launch()
        page = await browser.new_page()
        await page.goto("https://youtube.com")
        print(await page.title()) # YouTube  
        await browser.close()

asyncio.run(main())
```
### Browser Functions
``` python
firefox.launch(headless=True) # headless by default
# 200ms delay between actions, useful for seeing actions in headless=False mode
firefox.launch(slow_mo=200)
```
### Page Functions
``` python  
page.goto("https://playwright.dev/")
page.screenshot(path="example.webp")
page.title()
page.click()
page.wait_for_timeout(1000) # instead of time.sleep(1)
page.context.cookies()
```
### Locators
``` python
page.get_by_role("textbox", name="Address") # textbox, button...
page.get_by_label("Local time")
page.get_by_text("Item")
page.locator("#id")
page.locator("text=SEARCH")
page.get_by_placeholder("Username")
```
### Locator Functions
##### Text
``` python
page.get_by_role("textbox").fill("Hey")
page.get_by_label("Local time").fill("2020-03-02T05:15")  
locator.clear()
```
##### Click
``` python
page.get_by_role("button", name="search").click() # waits for button to appear before clicking
page.click("#button_id")
locator.dblclick() # double click  
locator.click(button="right")  
locator.click(modifiers=["Shift"])  
locator.hover()  
locator.click(position={ "x": 0, "y": 0}) # click top-left
locator.hover()
locator.drag_to()
```
##### Keyboard
``` python
locator.press("Backspace") # KeyW, Digit0, F1-F12, Backslash, ArrowDown, ShiftLeft+A...
locator.press_sequentially("hello", delay=100) # press h, wait 100ms, press e...
```
##### Checkbox
``` python
page.get_by_label('XL').check() # check XL size option for cloth
locator.select_option('XL')
locator.set_checked(False)
locator.uncheck()
```
##### Files
``` python
page.get_by_label("Upload file").set_input_files(  
    files=[  
        {"name": "test.txt", "mimeType": "text/plain", "buffer": b"this is a test"}  
    ],  
)
```
##### Useful Functions
``` python
locator.screenshot()
locator.select_text()
locator.scroll_into_view_if_needed()
```
### Assertions
wait until something is true
``` python
expect(locator).to_be_attached()
expect(locator).to_be_checked()
expect(locator).to_be_disabled()
expect(locator).to_be_editable()
expect(locator).to_be_empty()
expect(locator).to_be_enabled()
expect(locator).to_be_focused()
expect(locator).to_be_hidden()
expect(locator).to_be_in_viewport()
expect(locator).to_be_visible()
expect(locator).to_contain_text("Hey") # re.compile(r"\d messages")
expect(locator).to_have_attribute("type", "text")
expect(locator).to_have_class("my-class")
expect(locator).to_have_count(n) # list with 'n' children
expect(locator).to_have_css("display", "flex")
expect(locator).to_have_id("my-id")  
expect(locator).to_have_js_property("loaded", True)
expect(locator).to_have_text("my text")
expect(locator).to_have_value(re.compile(r"[0-9]"))
expect(locator).to_have_values(["Red", "Green"])
expect(page).to_have_title("My Title") # re.compile(r"Welcome, .*")
expect(page).to_have_url("youtube.com") # re.compile(".*checkout")
expect(response).to_be_ok()
```
