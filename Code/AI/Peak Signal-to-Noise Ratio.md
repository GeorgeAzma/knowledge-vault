How different image is from target image
### Formula $20\log_{10}(\frac{MAX}{\sqrt{MSE}})$
> [!note] Same scale as [[Decibel]]
- $MAX=max(p_{target})$ maximum pixel value
- $MSE=\sum_x\sum_y (p_{image}(x,y)-p_{target}(x,y))^2$
> [!note] For RGB images, use average PSNR or luminance PSNR
