## Swift 
- Enum
- discardableresult
- assert
- typealias
- convenience initialiser
- Hashable protocol
- Equatable Protocol
- Collection Protocol
- Comparable Protocol
- stride() function 

GCD 
How to call async functions
String manipulation
collectionView Protocol 

## iOS 

Xcode 12 - WWDC 2020
iOS - 14.6
Latest MacOS - Big Sur - macOS 11
Apple Silicon 

- App clips
- Widgets

Port your app to a universal app which runs on apple and intel 
Catalyst - iOS, iPad apps on the mac



## System Design 

Load Balancing
Caching 
CDN
Master/Slave replicas


https://leetcode.com/discuss/interview-question/system-design/1205825/FANG-System-Design-Interview-Preparation-Master-Doc
https://www.quora.com/What-is-the-best-way-to-prepare-for-a-System-Design-interview-for-Amazon
https://igotanoffer.com/blogs/tech/system-design-interviews
https://github.com/donnemartin/system-design-primer
https://www.careercup.com/page?pid=system-design-interview-questions


# DSA
How many cuts does a graph with n vertices have? 
2^n - 2 (2 choices per vertex)

 nC0 + nC1 + nC2 + … nCn = 2^n

## Questions 


### Strings
- Given a string like "(())", write a function that returns true if the string is properly nested - one closed parens for every open parens - and always in the order of open-closed.
- Write a function that generates a pangram using only palindromes (each word can only be used once)
- Given two strings, print out the minimum number of character flips that have to be made so that string A is an anagram of string B
- Given two strings, determine whether they can become the same after one flip of the characters they have
- Given a string, find all duplicate substrings of length K
- Given a string with one character inserted into the string in any position, write a function that finds the inserted character
- Check if a string is a palindrome
- Check if a string is a anagram
- Reverse a string
- Reverse all the words in a sentence 
- KMP Algorithm
- Rabin Karp
- Z's Algorithm
- https://www.geeksforgeeks.org/find-the-smallest-window-in-a-string-containing-all-characters-of-another-string/
- https://leetcode.com/problems/string-to-integer-atoi/
- https://leetcode.com/problems/integer-to-roman/
- https://leetcode.com/problems/word-ladder/
- https://leetcode.com/problems/word-ladder-ii/
- https://leetcode.com/problems/design-add-and-search-words-data-structure/
- https://leetcode.com/problems/reorganize-string/
- https://www.interviewbit.com/problems/matrix-median/
- https://www.interviewbit.com/problems/3-sum/
- https://www.interviewbit.com/problems/pair-with-given-difference/
- https://www.interviewbit.com/problems/first-non-repeating-character-in-a-stream-of-characters/
- https://www.interviewbit.com/problems/balanced-parantheses/
- String segmentation [You are given a dictionary of words and a large input string. You have to find out whether the input string can be completely segmented into the words of a given dictionary. The following two examples elaborate on the problem further.]
- Check if strings are rotations of each other
	


### Array
- Shuffle Algorithm 
- Interpolation search
- Search for an element in a sorted and rotated array https://www.interviewbit.com/problems/rotated-sorted-array-search/
- Counting inversions using the mergesort subroutine
- Find the kth smallest/largest element in an unsorted array
- Find the next greater element of all elements in a given array in O(n)
- Reverse a stack using recursion
- Convert array into Zig-Zag structure
- Generate all possible sorted arrays from alternate elements of two given sorted arrays
- Pythagorean triplet in an array
- https://www.geeksforgeeks.org/largest-sum-contiguous-subarray/
- Find the smallest positive integer that cannot be represented as a sum of any subset of a given array
- Smallest subarray with sum greater than a given value
- Stock buy sell to maximize profit (https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)
- Rotate an array in O(n) time and O(1) space [Juggling Algorithm]
- Tower of Hanoi
- Implement a Queue using stacks
- Implement two stacks in an array
- Reverse a stack without extra space in linear time *facepalm*
- Sort a stack using recursion or temp stack
- Reverse a number using a stack
- Design stack with getMin() in O(1) space and time https://leetcode.com/problems/min-stack/
- Circular Queue
- LRU Cache implementation
- Implement a stack using a single queue
- Reverse a Queue
- Reverse the first K elements of a Queue
- Find the second largest element in an array.
- Given a sorted array which can have repeated elements, find the occurrence of an element. (Most optimal solution is O(log n) – Using binary search to find start and end occurrence)
-  Implement a stack with push(), pop() and min() in O(1) time.
-  Rotate a matrix by 90 degrees.
- Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
- Say you have an array for which the ith element is the price of a given stock on day i. If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit. Note that you cannot sell a stock before you buy one
- Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000 https://leetcode.com/problems/longest-palindromic-substring/
- Convert a non-negative integer to its english words representation.
- https://leetcode.com/problems/search-suggestions-system/
- https://leetcode.com/problems/most-common-word/
- https://leetcode.com/problems/meeting-rooms-ii/discuss/67855/Explanation-of-%22Super-Easy-Java-Solution-Beats-98.8%22-from-%40pinkfloyda
- https://leetcode.com/problems/trapping-rain-water/
- https://www.geeksforgeeks.org/find-pythagorean-triplet-in-an-unsorted-array/
- https://www.geeksforgeeks.org/the-stock-span-problem/
- https://www.geeksforgeeks.org/maximum-sum-iarri-among-rotations-given-array/
- https://www.geeksforgeeks.org/print-a-given-matrix-in-spiral-form/
- https://www.geeksforgeeks.org/count-number-of-occurrences-or-frequency-in-a-sorted-array/
- https://www.geeksforgeeks.org/sliding-window-maximum-maximum-of-all-subarrays-of-size-k/
- https://www.geeksforgeeks.org/find-the-missing-number/
- https://www.geeksforgeeks.org/kth-smallest-element-in-a-row-wise-and-column-wise-sorted-2d-array-set-1/
- https://www.geeksforgeeks.org/to-find-smallest-and-second-smallest-element-in-an-array/
- https://www.geeksforgeeks.org/find-if-array-can-be-divided-into-two-subarrays-of-equal-sum/
- https://www.geeksforgeeks.org/given-an-array-of-numbers-arrange-the-numbers-to-form-the-biggest-number/
- https://www.geeksforgeeks.org/given-an-array-arr-find-the-maximum-j-i-such-that-arrj-arri/
- https://leetcode.com/problems/valid-sudoku/
- https://leetcode.com/problems/merge-intervals/
- https://leetcode.com/problems/game-of-life/
- https://leetcode.com/problems/minesweeper/
- https://leetcode.com/problems/pacific-atlantic-water-flow/
- https://leetcode.com/problems/design-tic-tac-toe/
- https://www.interviewbit.com/problems/set-matrix-zeros/
- https://www.interviewbit.com/problems/spiral-order-matrix-ii/
- https://www.interviewbit.com/problems/next-permutation/
- https://www.interviewbit.com/problems/maximum-absolute-difference/
- https://www.interviewbit.com/problems/maximum-unsorted-subarray/
- https://www.interviewbit.com/problems/median-of-array/
- https://www.interviewbit.com/problems/square-root-of-integer/
- https://www.interviewbit.com/problems/largest-rectangle-in-histogram/
- https://www.interviewbit.com/problems/redundant-braces/
- https://www.interviewbit.com/problems/nearest-smaller-element/
- https://www.interviewbit.com/problems/4-sum/
- https://www.interviewbit.com/problems/merge-k-sorted-lists/
- https://www.interviewbit.com/problems/distinct-numbers-in-window/
- https://www.geeksforgeeks.org/array-rotation/

### Linked List
- Implement a stack with a Linked Lists
- Reverse a linked list 
- Merge sort for linked list
- Find the merge point of two linked lists (Kickass wrap around solution using two pointers)
- https://www.geeksforgeeks.org/flattening-a-linked-list/
- https://www.careercup.com/question?id=5717797377146880
- Reverse a linked list in groups of given size
- Check if a singly LL is a palindrome
- Rotate a linked list
- https://www.geeksforgeeks.org/convert-a-given-binary-tree-to-doubly-linked-list-set-4/
- How do you sort a linked list? Know the pitfalls of applying general sorting techniques
- Given two numbers represented by two linked lists, write a function that returns sum list.
- Merge two sorted linked lists and return it as a new sorted list. The new list should be made by splicing together the nodes of the first two lists
- Detect a loop in a linkedlist https://www.interviewbit.com/problems/list-cycle/
- https://leetcode.com/problems/merge-two-sorted-lists/
- https://leetcode.com/problems/merge-k-sorted-lists/
- https://leetcode.com/problems/copy-list-with-random-pointer/
- https://leetcode.com/problems/insert-into-a-sorted-circular-linked-list/
- https://www.geeksforgeeks.org/write-a-c-function-to-print-the-middle-of-the-linked-list/
- https://practice.geeksforgeeks.org/problems/delete-middle-of-linked-list/1
- https://practice.geeksforgeeks.org/problems/remove-duplicate-element-from-sorted-linked-list/1
- https://www.geeksforgeeks.org/add-1-number-represented-linked-list/
- https://practice.geeksforgeeks.org/problems/remove-loop-in-linked-list/1
- https://practice.geeksforgeeks.org/problems/nth-node-from-end-of-linked-list/1
- https://www.geeksforgeeks.org/function-to-check-if-a-singly-linked-list-is-palindrome/
- https://www.geeksforgeeks.org/reverse-alternate-k-nodes-in-a-singly-linked-list/
- https://www.geeksforgeeks.org/delete-last-occurrence-of-an-item-from-linked-list/
- https://www.geeksforgeeks.org/rotate-a-linked-list/
- https://www.geeksforgeeks.org/reverse-a-linked-list/
- https://www.geeksforgeeks.org/why-quick-sort-preferred-for-arrays-and-merge-sort-for-linked-lists/
- https://www.geeksforgeeks.org/swap-kth-node-from-beginning-with-kth-node-from-end-in-a-linked-list/
- https://www.interviewbit.com/problems/reorder-list/
- https://www.interviewbit.com/problems/intersection-of-linked-lists/
- https://www.interviewbit.com/problems/reverse-link-list-ii/
- https://www.interviewbit.com/problems/kth-node-from-middle/
- https://www.interviewbit.com/problems/sort-binary-linked-list/
- https://www.interviewbit.com/problems/even-reverse/
- Copy linked list with arbitrary pointer



### Trees
- https://leetcode.com/problems/symmetric-tree/
- https://www.geeksforgeeks.org/level-order-traversal-in-spiral-form/
- https://www.geeksforgeeks.org/median-of-stream-of-integers-running-integers/
- Given an n-ary tree, check whether or not it is a mirror of itself (symmetric around its center)
- Create Binary Tree from it's Linked List representation
- Given a binary tree, check if it’s a mirror of itself
- Top View of a binary tree
- Construct a tree from given traversals
- Find minimum depth of a binary tree
- Maximum path sum in a binary tree
- Bottom view of a binary tree
- https://www.geeksforgeeks.org/check-if-a-given-array-can-represent-preorder-traversal-of-binary-search-tree/
- https://www.geeksforgeeks.org/if-you-are-given-two-traversal-sequences-can-you-construct-the-binary-tree/
- Lowest common ancestor in a BST
- https://www.geeksforgeeks.org/remove-nodes-root-leaf-paths-length-k/
- https://www.geeksforgeeks.org/check-binary-tree-subtree-another-binary-tree-set-2/
- https://www.geeksforgeeks.org/reverse-alternate-levels-binary-tree/
- Convert a BST into a DLL and DLL to BST in place.
- Vertical traversal of a Binary Tree https://www.geeksforgeeks.org/print-binary-tree-vertical-order/
- Write a function that returns the length of the longest leaf-to-leaf path in a binary tree (Diameter I think)
- https://leetcode.com/problems/diameter-of-binary-tree/
- Find the height and depth of a binary tree
- Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure."
- https://leetcode.com/problems/top-k-frequent-words/
- https://www.geeksforgeeks.org/binary-tree-to-binary-search-tree-conversion/
- https://www.geeksforgeeks.org/a-program-to-check-if-a-binary-tree-is-bst-or-not/
- https://www.geeksforgeeks.org/find-distance-between-two-nodes-of-a-binary-tree/
- https://www.geeksforgeeks.org/maximum-difference-between-node-and-its-ancestor-in-binary-tree/
- https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/
- https://leetcode.com/problems/populating-next-right-pointers-in-each-node/
- https://www.interviewbit.com/problems/maximum-sum-combinations/
- https://www.interviewbit.com/problems/bst-iterator/
- https://www.interviewbit.com/problems/root-to-leaf-paths-with-sum/
- https://www.interviewbit.com/problems/diagonal-traversal/
- https://www.interviewbit.com/problems/cousins-in-binary-tree/
- https://www.interviewbit.com/problems/merge-two-binary-tree/
- https://www.interviewbit.com/problems/maximum-edge-removal/


### Graphs 
- Adjacency Matrix
- Breadth First Search
- Depth First Search
- Dijkstra Shortest Path
- Floyd Warshall Shortest Path
- Prim - Minimum spanning tree
- Topological Sort
- Bellman ford
- Tarjan's algorithm
- Bridges in a graph
- https://www.geeksforgeeks.org/minimum-number-swaps-required-sort-array/
- https://www.geeksforgeeks.org/check-if-a-given-sequence-of-moves-for-a-robot-is-circular-or-not/
- You’re given a Boolean 2D matrix; can you find the number of islands? (https://leetcode.com/problems/number-of-islands/)
- Given a matrix of integers A with R rows and C columns, find the maximum score of a path starting at [0,0] and ending at [R-1,C-1].
- Given n nodes labeled from 0 to n-1 and a list of undirected edges (each edge is a pair of nodes), write a function to check whether these edges make up a valid tree
- Given a list of airline tickets represented by pairs of departure and arrival airports [from, to], reconstruct the itinerary in order. All of the tickets belong to a man who departs from JFK. Thus, the itinerary must begin with JFK
- https://leetcode.com/problems/course-schedule/
- https://leetcode.com/problems/course-schedule-ii/
- https://leetcode.com/problems/number-of-distinct-islands/
- https://www.geeksforgeeks.org/min-cost-path-dp-6/
- https://www.geeksforgeeks.org/detect-cycle-direct-graph-using-colors/
- https://www.geeksforgeeks.org/min-cost-path-dp-6/
- https://leetcode.com/problems/minimum-path-sum/


### Greedy 
- Huffman Decoding for greedy algorithms
- Activity Selection problem
- Job sequencing problem
- Connect n ropes with minimum cost
- Greedy algo for minimum number of coins. (Solve using DP)
- Dial's Algorithm
- https://www.interviewbit.com/problems/majority-element/


### Backtracking
- N Queens problem
- Print all permutations of a given string
- Generate all Combinations of a given string
- Print palidromic partitions of a string
- Word break Problem
- Print all possible paths from top left to bottom right of a `m*n` matrix
- Hamiltonian Cycle
- https://www.geeksforgeeks.org/print-all-interleavings-of-given-two-strings/
- Rat in a maze
- Warnsdorff's Algo
- https://www.geeksforgeeks.org/subset-sum-backtracking-4/
- https://www.geeksforgeeks.org/count-possible-decodings-given-digit-sequence/
- https://www.geeksforgeeks.org/count-ways-reach-nth-stair/
- https://leetcode.com/problems/combination-sum/
- https://leetcode.com/problems/word-search/
- https://leetcode.com/problems/word-search-ii/
- https://www.interviewbit.com/problems/subset/
- https://www.interviewbit.com/problems/subsets-ii/
- https://www.interviewbit.com/problems/kth-permutation-sequence/
- https://www.interviewbit.com/problems/knight-on-chess-board/



### Dynamic Programming 
- Print nth number in the Fibonacci series
- Coin Change Problem
- Egg dropping puzzle
- Longest common subsequence
- Longest Increasing subsequence https://leetcode.com/problems/longest-increasing-subsequence/
- Shortest edit distance
- 0-1 Knapsack problem
- Unbounded knapsack problem
- Ways to cover a distance
- Minimum partition
- Longest path in a matrix
- Subset sum problem
- Optimal strategy for a game
- Shortest common supersequence
- Find the max-weight independence set given a path graph (with reconstruction)
- Rod cutting
- Boolean Parenthesization problem
- Matrix chain multiplication
- https://www.geeksforgeeks.org/maximum-sum-such-that-no-two-elements-are-adjacent/
- https://www.geeksforgeeks.org/assembly-line-scheduling-dp-34/


### iOS 
- Given a UIView, it has superview, and superview has superview. given several views A, B, C, or more, check if these views have a common superview(parent)



### Other
- Primality Testing : Non-deterministic Algorithms  –  topcoder https://www.topcoder.com/community/data-science/data-science-tutorials/primality-testing-non-deterministic-algorithms/
- Convex Hull - Jarvis March Algorithm
- Maximum subarray XOR
- Magic number
- Count number of bits to be flipped to convert A to B
- Binary representation of a number 
- Count total set bits in all numbers from 1 to n
- Write a function that counts the total of set bits in a 32-bit integer.
- Rotate bits of a number
- Find next sparse number
- Travelling salesman problem
- Matrix multiplication
- In Facebook, find an efficient way to find the mutual friends between you and one of your given friends. Hint: hashing, dictionary data structure implementation
- For two very long numbers given, find the product of these numbers in an efficient way. Hint: using binary multiplication effectively.
- Given a number n, find the number just greater than n using same digits as that of n.
- There is a big file of words which is dynamically changing. We are continuously adding some words into it. How would you keep track of top 10 trending words at each moment?
- https://www.geeksforgeeks.org/the-celebrity-problem/
- https://www.geeksforgeeks.org/minimum-number-of-swaps-required-for-arranging-pairs-adjacent-to-each-other/
- https://www.geeksforgeeks.org/write-you-own-power-without-using-multiplication-and-division/
- https://www.geeksforgeeks.org/boolean-parenthesization-problem-dp-37/
- https://www.interviewbit.com/problems/first-missing-integer/
- https://www.interviewbit.com/problems/maximum-ones-after-modification/
- Josephus problem for recursion




### System Design
- Design a system to efficiently find 10 top-selling products in an online shopping site at any given time, with a window of 20 minutes
- Design a voting system where 100M users will be logging in within a window of 24h (not necessarily in a uniform way). Every user will be able to choose from a fixed list of options, and the system should not let them vote a second time
- Design a system that allows its users to upload images with tags. The tags should be searchable and said search should return images linked to those tags
- Design and implement a message broker which can handle high throughput and is fault-tolerant
- Design a workflow system that implements pause/continue operations of the workflow using the database
- Design a scheduler service that can handle high throughput with minimal latency
- Design an online chess game system that supports three modes: Player vs. AI, Player vs. Player (Online), Player vs. Player (Offline)
- Design a system similar to online judge platforms like HackerRank and Codechef
- You’re provided with different Excel files and the data format those files contain, as well as a low-level parser. Design a system that takes the Excel files and its data type as the inputs, and returns the list of data objects in that file
- Design a message board system like Reddit, where users can reply with messages on posted topics
- Design a system that takes values like latitude and longitude and returns the 5 closest locations based on these values
- The problem statement was to give an HLD for “Voting Management System“. Along with it, LLD was taken up for some of the modules present in the design, handling race conditions, etc. Leadership questions were present in all the rounds.
- Was asked to write an extensible cache management library, something like Redis
- Design an Instagram was the problem statement we tried solving in this round. Some queries/scales/db/API was taken up in detail.
- How would you design a warehouse system for Amazon.com
- How would you design Amazon.com so it can handle 10x more traffic than today
- How would you design Amazon.com's database (customers, orders, products, etc.)
- How would you design TinyURL
- How would you design Google's search autocomplete
- How would you design Dropbox
- How would you design a real time ranking system for Fortnite
- How would you design a parking payment system
- How would you design an electronic voting system
- How would you design a distributed cache system
- Design a valet parking lot with basic use-case of assigning ticket to customer and retrieving the car later. Three sizes available. Use best fit and nearest distance. 
- Design Messenger
- Design Snake Game using Object Oriented analysis and design technique.




## Behavioural Questions

*Tell me about a feature you developed from start to finish*
Gold native plan page

*Tell me about a time you made a serious mistake at work*
Crash went live in a feature I sent out. Stopped the rollout at 1% and rolled out a fix asap 

*Tell me about a project you were leading which failed* 
Infinity dining

*Why Amazon?*
[TODO] MDNA

*What was the hardest bug you've ever faced?*

*Tell me about a challenging project and how managed to deliver the expected outcome*
99%

- Every single interviewer is assigned a few leadership principles gauge the candidate on 
- Groups in Amazon use the LPs as guiding lights and have mini startups within the company

## Leadership Principles 

### Customer Obsession 
We all understand that the company performs better if our customers (and our employees) believe it’s acting in our best interest.
We’ve regularly made decisions at Amazon which lowered profit/sales, because it was the right thing to do for customers.

### Invent and Simplify 
Keep it simple stupid (KISS) 
MVP is firmly entrenched
We need people with a capacity for infinite ideas
We need the question of “What else?” to be met by such a long stream of answers that it would take us forever to try them all.
Simplicity allows for faster and cheaper innovation, and that’s why they’re married together with the principle of removing code and simplifying the code base


### Are right a lot
Get forgiveness instead of permission
question their own decisions and be open to counter opinions.
Right and wrong are a matter of knowing what you are trying to accomplish, what the options are, and how to compare the merit of the options
every perspective and opinion needs to be valued

### Learn and be curious
What new thing have you learned recently?
we do need is for you to be open and interested in learning new things.


### Hire and develop the best
If you’re comfortable, you’re not growing
We believe it’s the responsibility of every single person to help others grow. 
Pair up new joinees with recent joinees 

### Insist on the highest standards

We expect our leaders to be proud owners of the things they own, and as such, insist on standards which everyone (including themselves) should struggle to meet.
There's always a better, faster and more ingenious way to do something

Our goal is never to deliver to requirements — to only meet our goals. At all times — once you look past our official project goals — our goal is to improve. 
Our goal is to never accept that something is broken, to never feel that anything less than a perfect product is acceptable.

We care about fixing the root causes of problems (not just hiding or patching them). We care that you are always thinking “I know we can do better than this”.

### Think Big

If we are asking you in an interview for an idea, you can’t say the first small idea which pops in your head, and believe you’ve satisfied the requirement
When I’m interviewing someone, I prefer to think that someone’s idea is somewhat impossible, because explaining constraints to a co-worker is easier than explaining how to invent and think.


### Bias for Action
I know at your company it’s possible that you’re encouraged to not take action unless asked, but we find that unacceptable.
We want leaders who take action, are bold, are willing to take risks, because they know it’s the right thing to do.
For almost every major human-caused accident at Amazon, there’s a sheepish person who raises their hand and says “Yeah.. that was me”. And they’re still here, because we value calculated risk taking.
We value this type of risk taking, because we need to move fast in areas where we can’t possibly know the right answer. Option A or Option B? Pick and move on.

### Frugality 
Love stretch goals
This principle is all about ensuring that we can provide as much value for as little cost as possible
Things never cost what they cost, because we can always do less, do it cheaper, do it slower, do it with lower quality.We always have options.
We’re inventing to solve problems in a cheaper way. Which often is faster, easier to maintain, easier to extend, etc.
When you’re interviewing, we’re looking for you to understand that having not enough time or resources is a fine and expected thing. Having too much to do, and too little time is perfectly ok. Not doing everything you want on a project is healthy, because doing everything you ever wanted to do is inefficient.

## Earn Trust
Be vocally self-critical
When you’re explaining a mistake, first recognize your own, before explaining other misses.
It’s not about pointing blame, it’s about fixing processes.
As an interviewer, think carefully about how you deal with mistakes, both yours and others. We care about long term, not short. We care about fixing problems, not blaming. 
because we’re so decentralized, it’s critical that we trust those who we work with, because each of us have a lot of power and responsibility.


## Dive deep
“Trust yet verify” is a favorite phrase at Amazon.
If you increased traffic, you better know what you did. If you dropped error rates, you should know what the errors were. 
We care that people know details, because it means they cared enough to question things. We need curious and skeptical leaders.
I love when I ask questions of people, and they can go 4 or 5 levels deep, and keep getting more excited because the details are actually interesting to them.

### Have a backbone, disagree and commit
We never find it acceptable to do something because your boss said to. 
We do things because it’s the decision we’ve made, and with the data we’ve gathered, we’ve committed to that plan.
Data based disagreements are great. We use them all the time at Amazon, and examples of when you gathered data to make an argument are great.
As a leader, we can never feel (and certainly not express) glee in the failure of others. Cheering at others failures suggests that you’re playing a zero sum game, and the game is not zero sum within Amazon. 
“I told you so” is never acceptable
We need leaders who are able to recognize when disagreements are needed, and when they’re not. What’s worth arguing about, and what’s not. What’s worth escalating, and when it’s time to move on and start delivering. And we need to believe that you’re that type of person.

### Deliver Results
Leaders focus on the key inputs for their business and deliver them with the right quality and in a timely fashion. 
Do you know your key inputs?
We need people to recognize that they’re not accomplishing tasks, they’re focusing on inputs for their business. 
It is much harder (and much better) to focus on the business itself, rather than completing tasks.
Also, timely fashion, setbacks, and never settling
before you get yourself too wrapped up insisting on high standards, keep in mind that we’re extremely pragmatic. And we’re all about delivering the right results


## Links 
- [LP] https://www.scarletink.com/interviewing-at-amazon-leadership-principles/
- [Amazon interview questions]https://www.educative.io/blog/crack-amazon-coding-interview-questions
- [Amazon interview questions]https://leetcode.com/discuss/interview-question/488887/Amazon-Final-Interview-Questions-or-SDE1
- https://www.careercup.com/page?pid=amazon-interview-questions
- https://www.interviewbit.com/search/?q=Amazon
- [Amazon interview tutorial] https://www.youtube.com/watch?v=mjZpZ_wcYFg
- https://www.youtube.com/watch?v=XYje_uLz70g
- https://www.youtube.com/watch?v=gf8R7sgme6o
- https://dayone.careers/blog/amazon-interview-tips/
- [Behavioural]https://www.amazon.jobs/en-gb/landing_pages/phone-interview
- [Behavioural] https://candor.co/articles/interview-prep/acing-the-amazon-interview-process-from-a-to-z
- [x] https://www.geeksforgeeks.org/how-to-prepare-for-amazon-software-development-engineering-interview/
- [Daily Code Challenges] https://www.dailycodingproblem.com/zhiachong
- https://www.freecodecamp.org/news/how-i-landed-offers-from-microsoft-amazon-and-twitter-without-an-ivy-league-degree/
- [OOP] https://www.davidseek.com/ood/
- [iOS] https://github.com/dmyma/iOS-interview
- [Leetcode] https://leetcode.com/problemset/all/?listId=7p5x763&difficulty=Medium
- https://www.gradsiren.com/career-advice/20-question-for-amazon-technical-interview/
- https://www.geeksforgeeks.org/amazons-most-frequently-asked-interview-questions-set-2/
- https://www.geeksforgeeks.org/amazon-interview-questions/
- https://www.interviewcake.com/amazon-interview-questions
- [Backtracking] https://www.geeksforgeeks.org/top-20-backtracking-algorithm-interview-questions/
- [Linked list] https://www.geeksforgeeks.org/top-20-linked-list-interview-question/
- https://igotanoffer.com/blogs/tech/amazon-software-development-engineer-interview
- [Amazon interview tips] https://www.monsterindia.com/career-advice/here-is-how-you-can-ace-these-amazon-technical-interview-questions-and-answers-7510.html
- [Interview Experience] https://www.geeksforgeeks.org/amazon-interview-experience-2021-3-years-experienced/?utm_source=feedburner&utm_medium=email&utm_campaign=Feed%3A+Geeksforgeeks+%28GeeksforGeeks%29
- https://leetcode.com/problemset/all/?listId=7p5x763&difficulty=Medium



## High Priority Questions
Kruskal MST Lecture
Union Find - Detect a cycle in a graph
Master list of data structures and their running times - Add to quizlet
Practice LP Questions and HR round
max path sum of a binary tree
Construct a tree from given traversals
Given a binary tree, check if it’s a mirror of itself
Level order traversal in spiral form
Create Binary Tree from it's Linked List representation
https://www.geeksforgeeks.org/median-of-stream-of-integers-running-integers/
https://www.geeksforgeeks.org/reverse-alternate-levels-binary-tree/
https://www.geeksforgeeks.org/print-binary-tree-vertical-order/
https://leetcode.com/problems/diameter-of-binary-tree/
Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure."
https://www.geeksforgeeks.org/binary-tree-to-binary-search-tree-conversion/
https://www.interviewbit.com/problems/merge-two-binary-tree/
Paranthesis problem
Check if a string is a palindrome
Check if a string is a anagram
Reverse a linkedlist
https://leetcode.com/problems/number-of-islands/
Find the merge point of two linked lists
Merge sort for linked list
Generate all Combinations of a given string
Coin Change Problem
Egg dropping puzzle
Subset sum problem
Activity Selection problem
Job sequencing problem
Rotate an array in O(n) time and O(1) space [Juggling Algorithm]
Binary representation of a number 
https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
Generate all Combinations of a given string
Coin Change Problem
Egg dropping puzzle
Subset sum problem
Activity Selection problem
Job sequencing problem
Rotate an array in O(n) time and O(1) space [Juggling Algorithm]
Binary representation of a number 
https://leetcode.com/problems/best-time-to-buy-and-sell-stock/




