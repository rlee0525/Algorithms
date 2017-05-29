## A question involving an API's integration with hash map where the buckets of hash map are made up of linked lists
- I guessed a hash map with buckets of arrays and buckets of linked lists, but wasn't able to finish on time

## Given a singly linked list (a list which can only be traversed in one direction), find the item that is located at 'k' items from the end. So if the list is a, b, c, d and k is 2 then the answer is 'c'. The solution should not search the list twice.

## Given an array of numbers list out all quadruplets that sum to 0. Do so with a running time of less than O(n^4)  

## CTCI
# Question: Given a fleet of 50 trucks, each with a full fuel tank and a range of 100 miles, how far can you deliver a payload? You can transfer the payload from truck to truck, and you can transfer fuel from truck to truck. Assume all the payload will fit in one truck.
Challenge: Do you know the answer to this question? Post in the comments. Answers will be posted on April 22th.

Thanks Ole Sandbu, Czikus and Vanta for the answers.

We want to use as little fuel as possible so we try minimize the number of trucks we use as we go along. Let’s say we start with all 50 trucks with full fuel (5000 miles range). For each mile, we lose 50 miles in range. After two miles, we lose 100 miles leaving us with 4900 miles. This can be supported by 49 trucks so we drop one truck.
As you can see for every 100 miles we lose in range, we drop a truck.

50 trucks: 100/50
49 trucks: 100/49
…

Total distance = 100/50 + 100/49 + 100/48 + … + 100/2 + 100/1 (harmonic series) = 449.920533833
