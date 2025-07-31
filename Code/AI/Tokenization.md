Converts words into tokens (e.g. following $\to$ follow, ing)
### How it works
- Get all words and their frequencies from the training text
- Split text into words by separating them on space
- Create Vocabulary
- Add all words and their frequencies to the vocabulary, if it already exists just increase the frequency by word's frequency
- Iterate over the words
- Add all used characters in the word and the word's frequency as a pair to the vocabulary, if it already exits just increate the frequency by word's frequency
- Generate substrings from the words (e.g. abc $\to$ ab, bc)
- Add substrings and their word's frequencies to the vocabulary as a pair, if it already exists just increase the frequency by word's frequency
- Sort vocabulary by most frequently used tokens, but also make sure to give priority to single characters
- Grab top N most used tokens from the vocabulary
