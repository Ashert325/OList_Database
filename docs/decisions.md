# Decisions Log

Every modelling decision: what I chose, what else I considered, and why. Newest at the bottom.

<!-- Template: copy this block for each new decision

## YYYY-MM-DD: Decision title

**Context:** what prompted the decision
**Options considered:** A, B, C
**Chosen:** B
**Why:** the reasoning
**Tradeoff accepted:** what choosing B costs

-->

## 2026-11-10: Loading raw data as text

**Context:** when extracting data from a csv file, the columns aren't assigned any data types
**Options considered:** 
A: Let duckdb decide based on the data in the columns
B: I would decide what the data type for each column would be
**Chosen:** B
**Why:** As a personal reason it gives me a better understanding of the data but also from a technical standpoint, the way duckdb reads certain values such as floating point numbers as decimals that go past two decimal places when dealing with data especially cost or price. 
**Tradeoff accepted:** It would take more effort and time, as everytime I would need to clean a layer I would have cast every column it uses.

