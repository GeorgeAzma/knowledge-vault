``` python
opt = torch.optim.AdamW(model.parameters(), lr=1e-4, weight_decay=1e-4)
# scales grads for stability 
# eliminates under/overflow especially for low precision
scaler = torch.GradScaler()

epochs = 8
batch_size = 16
model.train() # enables dropout etc.
for epoch in range(epochs):
    for batch in dataset:
        batch = batch.to(device)
        opt.zero_grad(set_to_none=True)
        # mixed precision for ~2x faster training
        with torch.amp.autocast(device_type=dev.type, dtype=torch.bfloat16):
            z = model(batch)
            loss = loss_fn(z, target)
        scaler.scale(loss).backward()
        scaler.unscale_(opt)
        nn.utils.clip_grad_norm_(model.parameters(), max_norm=1.0)
        # unscales optimizer (unless unscale_ already called)
        # if grads have inf/NaNs then skip
        scaler.step(opt)
        scaler.update()
```