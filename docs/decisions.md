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
**Tradeoff accepted:** It would take more effort and time, as everytime I would need to clean a layer I would have to cast every column it uses.



## 2026-11-19: Casting delivery date as a date

**Context:** During the staging layer within the orders table there was a choice between casting estimated delivery date as a timestamp or date.
**Options considered:**
A: Set the column as timestamp
B: Set the column as date
**Chosen:** B
**Why:** Because with date, the chances of a delivery on the same day being classed as late would be reduced as with a timestamp if the estimated date is set to 18th Nov 00:00 and the delivery date was 18th Nov 15:00 this would be classed as late since it was past the time even though was on time.
**Tradeoff accepted:** To really check whether a delivery was late or not you would have to convert the remainder of the timestamp columns to a date to make a comparison/check.

## 2026-11-21: Casting order_item_id as an integer

**Context:** order_item_id is the line number within an order (1 to 21). It loads as text.
**Options considered:**
A: keep it as text
B: cast it to integer
**Chosen:** B
**Why:** I imagine from a management point of view using a group or sort by function would be better when the coloumn type is interger rather text as with text there would be cases where "13 could come before 2"
**Tradeoff accepted:** in the worst case, if a non number was picked up in the coloumn this would break the code and we would recieve an error.

## 2026-11-21: Handling not_defined payment types

**Context:** 3 of 103,886 payments have payment_type 'not_defined'. All three are £0.00, a single payment with 1 instalment.
**Options considered:**
A: To keep them as they are
B: Relabel them as 'unknown'
C: Remove these rows
**Chosen:** A
**Why:** This is because, they are not really causing any issues in the data and this is not something that is part of the staging process. Business rules to replace certain wording can be applied at a later stage.
**Tradeoff accepted:** I guess it doesn't make it super clear as to what the not-defined data could suggest.