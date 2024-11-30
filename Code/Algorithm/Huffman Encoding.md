Encodes information into it's smallest form possible
> [!note]
> This works for any information, however, if you know something about the information you can compress it further with other methods
### How it works
- Example for compressing characters in a document:
	- Count characters and sort by frequency
	- Add two least used characters with their frequency sum to the list, wherever it belongs for list to stay sorted
	- Repeat
- Final result: ![[Huffman Character Tree.webp]]
- Convert text into binary (example for `W`):
	- Try to reach to `W` from the start
	- Each time you go left write 0
	- Each time you go right write 1
- Now you have binary representation for `W`

> [!note]
> You have to save huffman tree with the binary to be able to decode it back into characters
