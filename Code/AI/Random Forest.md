[[Classification]]/[[Regression]] algorithm `not fully finished`

| Chest Pain | Good Blood | Blocked Arteries | Weight | Heart Disease |
| :--------: | :--------: | :--------------: | :----: | :-----------: |
|     No     |     No     |        No        |  125   |      No       |
|    Yes     |    Yes     |       Yes        |  180   |      Yes      |
|    Yes     |    Yes     |        No        |  210   |      No       |
|    Yes     |     No     |       Yes        |  167   |      Yes      |
### How It Works
- **Creating Forest**
    - **Create bootstrapped dataset** randomly select rows 
      from original dataset `duplicates allowed, same size as original`
    - **Select N random subset of columns/variables** `no duplicates` 
      choose one that classifies data better and create [[Decision Tree]] root with it
    - **Select again** `no duplicates, including previous columns`
      create [[Decision Tree]] node again, do this until columns run out
    - **Do above again for new bootstrapped dataset K times**
- **Using Forest**
    - **Classify new row/data using forest** `all decision trees`
    - **Count votes for each class** and classify new data as class with most votes

More Info youtu.be/J4Wdy0Wc_xQ
