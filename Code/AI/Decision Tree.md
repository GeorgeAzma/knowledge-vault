[[Classification]]/[[Regression]] algorithm
**Example** will user buy a car
``` mermaid
graph TD
    A[Income > 50k] -->|Yes| B[Age < 30]
    A -->|No| C[Won't Buy]
    B -->|Yes| D[Won't Buy]
    B -->|No| E[Buy]
```

| Income | Age | Buy |
| :----: | :-: | :-: |
|   31   | 34  | No  |
|   63   | 21  | No  |
|   15   | 22  | No  |
|   89   | 41  | Yes |
