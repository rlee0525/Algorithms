// 1a) TwoSum

function twoSum(nums, target) {
  let pair = {};

  for (let i = 0; i < nums.length; i++) {
    let num = nums[i];
    
    if (num in pair) return [pair[num], i];

    pair[target - num] = i;
  }
}

// 1) brute force N2
// 2) sort and bidrectional search N log N
// 3) hash N

// 1b) 3Sum

function threeSum(nums) {
  nums = nums.sort((a, b) => a - b);
  let solutionSet = [];

  for (let i = 0; i < nums.length - 2; i++) {
    // prevent duplicates
    if (i === 0 || nums[i] !== nums[i - 1]) {
      let low = i + 1;
      let high = nums.length - 1;

      // prevent duplicates as well
      while (low < high) {
        if (nums[i] + nums[low] + nums[high] === 0) {
          solutionSet.push([nums[i], nums[low], nums[high]]);
          low++;
          high--;

          while (nums[low] === nums[low - 1]) low++;
          while (nums[high] === nums[high + 1]) high--;
        } else if (nums[i] + nums[low] + nums[high] > 0) {
          high--;
        } else {
          low++;
        }
      }
    }
  }

  return solutionSet;
}

// 1) brute force N3
// 2) sort and bidrectional search N2 + N log N

// 1c) 4Sum

const fourSum = (nums, target) => {
  nums = nums.sort((a, b) => a - b);
  let solutionSet = [];

  for (let i = 0; i < nums.length - 3; i++) {
    // prevent duplicates
    if (i === 0 || nums[i] !== nums[i - 1]) {
      for (let j = i + 1; j < nums.length - 2; j++) {

        // prevent duplicates again
        if (j === i + 1 || nums[j] !== nums[j - 1]) {
          let low = j + 1;
          let high = nums.length - 1;

          // preveting duplicates once again
          while (low < high) {
            if (nums[i] + nums[j] + nums[low] + nums[high] === target) {
              solutionSet.push([nums[i], nums[j], nums[low], nums[high]]);
              low++;
              high--;

              while (nums[low] === nums[low - 1]) low++;
              while (nums[high] === nums[high + 1]) high--;
            } else if (nums[i] + nums[j] + nums[low] + nums[high] > target) {
              high--;
            } else {
              low++;
            }
          }
        }
      }
    }
  }

  return solutionSet;
};

// 1) brute force N4
// 2) sort and bidrectional search N3 + N log N


// 2) Longest substring without repeating characters
const lengthOfLongestSubstring = string => {
  // keep track of indices of visited characters
  let visited = {};

  // keep track of max count
  let count = 0;
  let startIdx = 0;

  for (let i = 0; i < string.length; i++) {
    let char = string[i];

    // check where to start again. If current start index is smaller, you can change it the visited character + 1.
    if (char in visited && startIdx <= visited[char]) {
      startIdx = visited[char] + 1;
    } else {
      count = Math.max(count, i - startIdx + 1);
    }

    visited[char] = i;
  }

  return count;
};

// 1) brute force N2
// 2) hash to store indices N

// 3) Longest common prefix
function longestCommonPrefix(array) {
  if (array.length === 0) return "";

  array = array.sort((a, b) => a.length - b.length);
  let prefix = "";

  for (let i = 0; i < array[0].length; i++) {
    let current = array[0][i];

    for (let j = 0; j < array.length; j++) {
      if (current !== array[j][i]) return prefix;
    }

    prefix += current;
  }

  return prefix;
}

function longestCommonPrefix2(array) {
  let prefix = "";

  if (array.length === 0) return prefix;

  let idx = 0;

  while (true) {
    let currentChar = array[0][idx];

    for (let i = 0; i < array.length; i++) {
      if (!array[i][idx] || array[i][idx] !== currentChar) return prefix;
    }

    idx++;
    prefix += currentChar;
  }
}

// 1) sort and compare NlogN + MN
// 2) compare NM

// 4) Group Anagrams

const groupAnagrams = array => {
  let anagrams = {};

  for (let i = 0; i < array.length; i++) {
    let word = array[i];
    let sorted = word.split("").sort();

    if (sorted in anagrams) {
      anagrams[sorted].push(word);
    } else {
      anagrams[sorted] = [word];
    }
  }

  let key;
  let groups = [];

  for (key in anagrams) {
    groups.push(anagrams[key]);
  }

  return groups;
};

// 1) bruteforce - keep iterating the array over and over again until all are checked.
// 2) keep hash - key as sorted word, value as an array of anagrams. return values of hash. NMlogM + N

// 5) Merge Intervals
const merge = intervals => {
  if (intervals.length === 0) return [];
  
  intervals = intervals.sort((a, b) => a[0] - b[0]);
  let merged = [];
  let currentInterval = intervals[0];

  for (let i = 1; i < intervals.length; i++) {
    if (currentInterval[1] >= intervals[i][0]) {
      currentInterval = [currentInterval[0], Math.max(currentInterval[1], intervals[i][1])];
    } else {
      merged.push(currentInterval);
      currentInterval = intervals[i];
    }
  }

  merged.push(currentInterval);
  return merged;
};

// 1) sort by starting time, compare end time of previous one and merge it if necessary. NlogN + N

// 7) Word ladder
const ladderLength = (beginWord, endWord, wordList) => {
  // keep visited checked in queue
  let visited = {};
  let queue = [beginWord];
  // first global count
  let count = 1;

  while (queue.length !== 0 && count < wordList.length) {
    let current = queue.shift();
    
    // store data with newest count
    if (Array.isArray(current)) {
      count = current[1];
      current = current[0];
    }

    for (let i = 0; i < wordList.length; i++) {
      let word = wordList[i];
      
      // Only visit new words && one word away
      if (!visited[word] && oneWordAway(current, word)) {
        queue.push([word, count + 1]);
        visited[word] = true;

        if (word === endWord) return count + 1;
      }
    }
  }

  return 0;
};

const oneWordAway = (word1, word2) => {
  let difference = Math.abs(word1.length - word2.length);
  if (difference > 1) return false;

  let shorterWord = word1.length > word2.length ? word2 : word1;

  for (let i = 0; i < shorterWord.length; i++) {
    if (word1.charAt(i) !== word2.charAt(i)) difference++;
    if (difference > 1) return false;
  }

  return true;
};

// BFS - 1) keep universal count. 2) one letter away method. 3) enqueue if true. 4) return count when endWord is reached.

// 8) Reverse words in a string
const reverseWords = str => {
  return str.trim().split(/\s+/).reverse().join(" ");
};

// trim / iterate / reverse  N

// 9) Isomorphic strings
const isIsomorphic = (str1, str2) => {
  // key as str1 char and value as str2 char
  let pairs = {};
  // str2 characters that has been seen
  let visited = {};

  if (str1.length !== str2.length) return false;

  for (let i = 0; i < str1.length; i++) {
    let char1 = str1.charAt(i);
    let char2 = str2.charAt(i);

    if (char1 in pairs && pairs[char1] !== char2) return false;
    if (!pairs[char1] && visited[char2]) return false;
    if (!pairs[char1] && !visited[char2]) {
      pairs[char1] = char2;
    }

    visited[char2] = true;
  }

  return true;
};

// 1) check lengths. 2) iterate together while storing str1 as key and str2 as value. return false.

// 10) Reverse Linked List
const reverseList1 = head => {
  let prev = null;

  while (head) {
    let current = head;
    head = head.next;
    current.next = prev;
    prev = current;
  }

  return prev;
};

const reverseList = head => {
  return _reverseList(head);
};

const _reverseList = (head, prev = null) => {
  if (!head) return prev;

  let current = head;
  head = head.next;
  current.next = prev;

  return _reverseList(head, current);
};

// 1) iterate
// 2) DFS - stack

// 11) Course Schedule
const canFinish = (numCourses, prerequisites) => {
  let inEdgeCount = {};
  let outEdges = {};

  for (let i = 0; i < prerequisites.length; i++) {
    let course1 = prerequisites[i][0];
    let course2 = prerequisites[i][1];
    
    if (!inEdgeCount[course1]) inEdgeCount[course1] = 0;
    if (!outEdges[course1]) {
      outEdges[course1] = [course2];
    } else {
      outEdges[course1].push(course2);
    }
    
    if (!inEdgeCount[course2]) {
      inEdgeCount[course2] = 1;
    } else {
      inEdgeCount[course2]++;
    }
  }

  let queue = [];
  let vertex;

  for (vertex in inEdgeCount) {
    if (inEdgeCount[vertex] === 0) {
      queue.push(vertex);
    }
  }

  while (queue.length !== 0) {
    let current = queue.shift();
    let courses = outEdges[current];

    if (courses) {
      for (let i = 0; i < courses.length; i++) {
        let course = courses[i];
        inEdgeCount[course]--;

        if (inEdgeCount[course] === 0) {
          queue.push(course);
        }
      }
    }
  }

  for (vertex in inEdgeCount) {
    if (inEdgeCount[vertex] !== 0) return false;
  }

  return true;
};

// Topological sorting O(V + E);
// Create count of inedges, and hash of outedges.
// BFS to iterate queue with inedge count = 0; (without prerequisites)
// iterate through all the outedges.
// repeat

// 13) Invert Binary Tree
const invertTree = root => {
  if (!root) return null;

  let temp = root.left;
  root.left = invertTree(root.right);
  root.right = invertTree(temp);

  return root;
};

// 14) Valid Anagram
const isAnagram = (s, t) => {
  if (s.length !== t.length) return false;
  
  let charSeen = {};
  for (let i = 0; i < s.length; i++) {
    let char1 = s[i];
    let char2 = t[i];

    if (charSeen[char1]) {
      charSeen[char1]++;
    } else {
      charSeen[char1] = 1;
    }

    if (charSeen[char2]) {
      charSeen[char2]--;
    } else {
      charSeen[char2] = -1;
    }
  }

  let char;

  for (char in charSeen) {
    if (charSeen[char] !== 0) return false;
  }

  return true;
};