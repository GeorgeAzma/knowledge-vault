### Load
``` python
import pandas as pd

df = pd.read_csv("data.csv")        # CSV
df = pd.read_excel("file.xlsx")     # Excel
df = pd.read_json("data.json")      # JSON
```
### Debug
``` python
df.head() # first n elements
df.info() # columns + dtypes
df.describe() # column min/max/mean/25%/50%/75%...
```
### Index
``` python
df["age"]
df.age
df[["name", "score"]]
df.iloc[0] # 1st row
df.iloc[0:2]

df.loc[5, "score"] # value at [row, col]
df.loc[(df.age > 10) & (df.score < 60), "score"] = 999
```
### Update
``` python
df["ratio"] = df.score / df.age # updates whole column, based on other columns

df.drop(columns=["score"])
df.drop(index=[0, 2]) # remove rows [0, 2], outputs new df, unless inplace=True

df.sort_values("age")
df.sort_values(["age", "score"], ascending=[True, False])
```
### Group
``` python
df.groupby("name")["score"].mean()

# aggregates/calculates score mean of the group and age max
df.groupby("name").agg({"score": "mean", "age": "max"})
```
### Merge / Join / Combine
``` python
pd.merge(df1, df2, on="id") # merges 2 dataframes by matching row ids

pd.concat([df1, df2], axis=0)   # vertical, adds df2 rows to df1. column count must match
pd.concat([df1, df2], axis=1)   # horizontal, adds df2 columns to df1. row count must match
```
### Export
``` python
df.to_csv("out.csv", index=False)
df.to_excel("out.xlsx", index=False)
df.to_json("out.json")
```
### NaNs
``` python
df.isna().sum() # how many NaN rows
df.fillna(0) # NaN => 0
df.dropna() # remove rows with NaN in any column
```
### Lambda
``` python
df["clean_name"] = df["name"].apply(lambda x: x.strip().lower())
df["clean"] = df["name"].str.lower() # similar to above

df["year"] = pd.to_datetime(df["date"]).dt.year
```