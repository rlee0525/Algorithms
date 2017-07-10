# Yelp

- start at page 12 of glassdoor

## Behavioral Questions
- Why Yelp?
- Resume Overview
- Describe your previous projects
- Research work
- What's the biggest difficulty you faced for your projects?
- What was the hardest issue you've had to solve when coding and how did you resolve it?
- What things do you care about the most for your first full-time job?
- What is something you'd like to work on if you were to work at Yelp?
- What would you change / improve upon if you were to redo your project?
- What's a technical challenge you worked on and how did you solve it?
- How would you improve Yelp?
- Yelp cultural fit - research this.
- Salary expectation
- Describe yourself in three words.
- How do you detect a spam-review using ML?


## Interview Questions
- Remove duplicates from a string
- Reduce a 2D array where you need to sum the same elements and return them sorted by amount
- Implement Dequeue, Enqueue, FindMin()
- Merge Interval
- What happens when you type the address in browser?
- How does the web browser take you into the right website when you type something? (Explain the mechanism)
- HackerRank - You have two arrays: Find a mutual item with the best ranking
- **If you have 3 server and reqeusts are coming in, how would you effectively distribute the loads**
- **Input: list of strings - Output:list of list of strings with anagrams together**
- What might make a website slow?
- Dictionaries and list manipulation
- Lots of runtime questions
- Difference between C++ and python (maybe research briefly into ruby / javascript vs. lower level lang)
- Dynamic and static typing
- Given two vertices in a directed graph, find whether there is a path from one to the other.
- How do you merge duplciate businesses in a list?
- Two sum
- System design question: Design an URL shortener
- How do you deal with large amount of contents for list views in Android?
- Adjust line of cursor in google doc
- Difference between process and thread
- Group anagram
- Word search in a matrix
- KNN (K nearest neighbors)
- Course Schedule
- BFS Graph question
- Sort strings containing restaurant names and ratings by ratings
- Given a list of businesses and their ratings, return the median (the business with the median rating)
- **Someone reports openting the webpage of Yelp takes too long, what may cause these situations and how can you deal with it?**
- Given a list of the retaurants' opening time, merge them if they have overlap and write some test cases. (merge interval problem from the leetcode)
- Implement a BFS in your preferred programming language.
- Given the length and width of a board, also given a number n, generate a board that randomly contains n mines in this board.
- Color sort: given a collection of different colors, return the sorted collection of colors based on the frequency.
- Design DB for Yelp - Database normalization, SQL injection, etc.
- How would you flag out Yelp reviews that posts links or ads in it?
- Where can you apply binary search - sorted arrays of linked lists?
- Given N words, decide if all words were anagrams of each other. ("cat", "act", "tac" => true, "cat", "bat", "act" => false)
- Read strings and sort them.
- Given a string of words, reverse the words ("I like cats" => "cats like I")
- What happens when you type "yelp.com" on your browser?
- Given a string, how would you check if the string is a palindrome?
- Search complexity in a sorted and unsorted array.
- How many bits are in an Octal number?
- Examples of Unsuperviesed and Supervised learning algorithms
- If you would like to contribute to a product at Yelp, which one will it be?
- How would you reverse a linked list?
- Invert a binary tree.
- Given a list and an integer k, produce a list of distinct pairs that add up to k
- Make a search table
- Topological sort
- Subset sum
- How would you write a script to automate web scraping from command line?
- What is SSL?
- Return all words in the list with the prefix that user searched for and without traversing the list every time.
    - Use a trie to arrange the words in the list. Then a simple prefix path can lead to the possible words for that prefix and you can give these suggestions to the user during typing.
- Given an array of strings with commit ids, and a predicate isBuggy that returns if a single commit is buggy, write a program that finds the first buggy commit.
    - When a commit is buggy, we assume that all its children are buggy.
    - When a commit is not buggy, we assume that all its ancestors are not buggy
- You have an array with words. Print them by anagrams groups.
- Dataset in a plain text file, data-structure-ize it and sort it.
- You have a user-submitted review (basically just a paragraph of 5 sentences). Design and write an algorithm to break up the review into sentences, and put it in a list / array data structure. (How to deal with non-standard punctuation)
- Parsing, data-structure-izing, and drawing conclusions from a large dataset in a plain text file.
- Given a segment of JS code, tell them what it does (Can be tricky and doesn't actually do what it seems to do)
- Make an image slideshow from a bunch of URLs in a MySQL DB. Talk through how you would design the backend and frontend to do this.
- Categorize a list of words into its anagrams
- Given a company name and rank #, sort the companies by their number.
- Describe lifecycle of an HTTP request.
- Print all the possible words combination from a long string with no space.
- All the sorting algorithms
- Search algorithms - yelp?
- Given a list of words, return a list of list of words that are anagrams of each other.
- **Questions about HTTP, SSL, DNS**
- Palindrome (CTCI?)
- OOP
- Implement a fucntion to take a collection of SET cards and identify a set if it exists or return an error status or something similar if it does not. This is according to the rules of the game "SET"
- Design an LRU Cache
- Subtract two strings
- 


## Algos
- Leetcode Easy - Medium level problems (Some were straight up copied from it)
- CTCI

## Possible Questions
- Numerical Analysis
- Puzzle question
- Duplicates
- Overlaps
- How to solve a crossword puzzle like problem (Find all the possible words)
- Recursion
- make sure you know how to parse stdin in your chosen language before you go in. (HackerRank)



## Longer question
**Interview Questions**
The problem:
I'm working on a collaborative code editor between 2 people. I have the text
synchronizing across both screens. However, I have run into the problem
illustrated below.

Example

Screen Person A Initially Screen Person B Initially
|Cat Ca|t

After pressing Enter on Screen1

Screen Person A After Screen Person B After
                                                  |
|Cat Cat

>>>Expecter Output<<<

Screen Person A After Screen Person B After

|Cat Ca|t

The content updates and the word cat shifts down a line. However, Person B's
cursor is left in it's original position instead of moving down a line as expected.

Implement the fixCursorRow method don't worry about updating the column.
*/

public class Cursor {
    public int column;
    public int row;

    public Cursor(int row, int column);
}

// diff comes from the other screen.
// content is content of the current screen before diff is applied.
// cursor is the cursor of the current screen.

// diff format:
// The diff contains all content from beginning to end of document.

{{"1", "\n"}, {"0", "cat"}}
// house -> horse = {{"0", "ho"}, {"-1", "u"}, {"1", "r"}, {"0", "se"}}
// "0" -> equality, "1" -> addition, "-1" -> removal
public Cursor fixCursorRow(String[][] diff, String content, Cursor cursor) {
}  


**Interview Questions**
Given two sparse Vectors, compute the Dot Product.
Input Format : The first line will contain two numbers(k and n), which are the number of entries for the two vectors respectively.
The next k lines are the entries for the first vector, of the form : x y
where x is the position and y is the value at that position in the vector.
The n lines are the entries of the second vector.
Any entries not specified indicate zero at that position.
The two vectors will always be of the same length

Example input:
3 3
1 4
4 2
5 3
1 7
2 6
5 1

Sample Answer: Dot Product = 4*7+3*1 = 31 (only print 31)  


=> Scanner sc = new Scanner(System.in);
Int k = sc.next();
Int n = sc.next();
Vector v1 = new Vector();
For(int I = 1; I <= k; i++){
    Int pos = sc.next();
    If(pos == i){
        V1.add(sc.next());
    }else{
        While(I != pos){
            V1.add(0);
        }
V1.add(sc.next());
    }
}
Vector v2 = new Vector();
For(int I = 1; I <= n; i++){
    Int pos = sc.next();
    If(pos == i){
        V2.add(sc.next());
    }else{
        While(I != pos){
            V2.add(0);
        }
V2.add(sc.next());
    }
}
Iterator it1 = v1.iterator();
Iterator it2 = v2.iterator();
Int res = 0;
while(it1.hasNext() && it2.hasNext()){
    res += it1.next() * it2.next();
}
Return res;

