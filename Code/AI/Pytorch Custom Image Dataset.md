
``` python
from torchvision import transforms
from PIL import Image

class CustomImageDataset(Dataset):
    def __init__(self, folder, image_size=128):
        self.folder = folder
        self.image_paths = [
            os.path.join(folder, fname)
            for fname in os.listdir(folder)
            if fname.lower().endswith((".webp", ".webp", ".webp"))
        ]        
        channels = 3
        mean = 0.5
        std = 0.5
        self.transform = transforms.Compose(
            [
                transforms.Resize((image_size, image_size)),
                transforms.ToTensor(),
                transforms.Normalize([mean] * channels, [std] * channels),
            ]
        )

    def __len__(self):
        return len(self.image_paths)

    def __getitem__(self, idx):
        img = Image.open(self.image_paths[idx]).convert("RGB")
        return self.transform(img)

dataset = CustomImageDataset("image_folder/", image_size=128)
dataloader = DataLoader(dataset, batch_size=32, shuffle=True, num_workers=4)
```
