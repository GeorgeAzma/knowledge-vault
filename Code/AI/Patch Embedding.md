[[Word Embedding]][[s]] for images, where image is divided into ~16x16 patches
which are encoded as embeddings using convolution layer
``` python
patch_embed = nn.Conv2d(img_channels, embed_dim, kernel_size=patch_size, stride=patch_size)
```