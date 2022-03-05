import pandas as pd
import numpy as np

# read files 
df1 = pd.read_csv('dataset1.csv')
df2 = pd.read_csv('dataset2.csv')

# combine df1 and df2 
df = df1.append(df2, ignore_index=True)

# remove title 
df['name']= df['name'].str.split('\.').str[-1].str.strip()
# split name column into first_name and last_name 
df[['first_name','last_name']] = df['name'].str.split(' ', 1, expand=True)

#delete rows with no name
df = df.dropna(subset=['name'])

# remove prepend zeros 
df["price"] = df["price"].astype(str)
df["price"] = [price_data.lstrip('0') for price_data in df["price"]]


#Create a new field named above_100, which is true if the price is strictly greater than 100
df["price"] = pd.to_numeric(df["price"], downcast="float")
df['above_100'] = ['true' if x > 100 else 'false' for x in df['price']]

# remove name column 
df.pop('name')

#save as csv 
df.to_csv('processed_data', encoding='utf-8', index=False)
