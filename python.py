import pandas as pd
import random
from pandas import DataFrame

opdcases = ["asthma", "nausea", "COPD", "Bronchitis", "Pneumonia", "heart problem", "fever"]
dates = ""

opdlength = len(opdcases)

data = pd.read_csv("pollution.csv")
attribute = "Sampling.Date"
dates = data[attribute]

randomcases = []
cases = []

for i in range(0, dates.size-1):
    cases = []
    for j in range(0, 20):
        case = random.randint(0, opdlength-1)
        cases.append(opdcases[case])
    randomcases.append(cases)
for i in range(0, len(randomcases)):
    print(randomcases[i])

data = {
    'dates' : dates[0:2391],
    'cases' : randomcases[0:2391]
    }

df = DataFrame(data, columns=['dates','cases'])
#df.to_csv("file.csv", index=False)

print(dates[0,2391])


