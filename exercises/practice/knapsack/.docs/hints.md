# Hints

## A starting point: brute-force recursion

If you're stuck, a good starting point is a brute-force recursive solution. You can see it sketched out in the first half of the article ["Demystifying the 0-1 knapsack problem: top solutions explained"](demystifying-the-knapsack-problem).

## Dynamic programming: what is it?

For a more efficient solution, you can improve your recursive solution using *dynamic programming*, which is introduced in the second half of [the above-mentioned article](demystifying-the-knapsack-problem).

For a more general explainer, see the video ["5 Simple Steps for Solving Dynamic Programming Problems"](solving-dynamic-programming-problems)

## Dynamic programming and the knapsack problem

If you need a more visual walkthrough of how to apply dynamic programming to the knapsack problem, see the video ["0/1 Knapsack problem | Dynamic Programming"](0-1-knapsack-problem).

Also worth mentioning is [this answer](intuition-of-dp-for-knapsack-problem) to a question on Reddit, *"What is the intuition behind Knapsack problem solution using dynamic programming?"*. Here is the answer in full:

> The intuition behind the solution is basically like any dynamic programming solution: split the task in many sub-tasks and save solutions to these sub-tasks for later use.
>
> In this case the sub task is to "try x items to fit into a knapsack of a smaller size" instead of trying all possible variations in the whole thing right away.
>
> The idea here is that at any point you can ask "does this item fit into the sack at all?" If no, you repeat by looking at a bigger portion of the sack until you reach the whole size of it, if the item still doesn't fit, then it's simply not part of any solution.
>
> If it does fit however, then there are two options. Either the maximum value for that portion of the sack is achieved without the item or without the item. If the former is true then we can just take the previous solution because we already tried the previous items. (For example if we try item 4 and it doesn't increase our maximum then we can just use our previous solution for items 1-3) If the latter is true then we put item 4 in which takes some value off of our capacity, the remaining capacity gets filled with a previous solution. How? Well we already tried smaller capacities beforehand so there should be a solution for that smaller, in this case remaining, capacity.
>
> So the main idea is basically to split the entire knapsack problem into smaller knapsack problems. Instead of testing 10 items with capacity 50, you first try (after the trivial case of 0) 1 item and capacity 10, 20, 30, 40 and 50 (or how ever many sub tasks you want to create) and then take another item and start again at capacity 10.
>
> If you see item 1 fits into capacity 20+ then all these slots in the table now contain this value. Then you look at item 2 from capacity 10-50 again. Lets assume item 2 fits into capacity 20 as well. Then now you check whether it is a new maximum or not and if it is then you update the table. Now you look at capacity 30 for item 2, you see that item 2 fits, this means 10 capacity would remain if you take it, however there, as of now, was no item that fits into 10 capacity, thus the solution remains the same as before. At 40 this changes, you now realize that even if you include item 2 there are 20 capacity remaining, thus you can fill that space with the previous solution, which was item 1. Thus for 40 capacity, as of now, the optimal solution is to take item 1 and 2. And so on.

[demystifying-the-knapsack-problem]: https://www.educative.io/blog/0-1-knapsack-problem-dynamic-solution
[solving-dynamic-programming-problems]: https://www.youtube.com/watch?v=aPQY__2H3tE
[0-1-knapsack-problem]: https://www.youtube.com/watch?v=cJ21moQpofY
[intuition-of-dp-for-knapsack-problem]: https://www.reddit.com/r/explainlikeimfive/comments/junw6n/comment/gces429
