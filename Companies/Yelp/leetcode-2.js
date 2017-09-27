// 1a) Two Sum

function twoSum(nums, target) {
  let hash = {};

  for (let i = 0; i < nums.length; i++) {
    if (nums[i] in hash) return [hash[nums[i]], i];

    hash[target - nums[i]] = i;
  }
}

// 1b) Three Sum
const threeSum = nums => {
  nums = nums.sort((a, b) => a - b);
  let set = [];

  for (let i = 0; i < nums.length - 2; i++) {
    if (i === 0 || nums[i] !== nums[i - 1]) {
      let low = i + 1;
      let high = nums.length - 1;

      while (low < high) {
        if (nums[i] + nums[low] + nums[high] === 0) {
          set.push([nums[i], nums[low], nums[high]]);
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

  return set;
};

// 1c) Four Sume
const fourSum = (nums, target) => {
  nums = nums.sort((a, b) => a - b);
  let set = [];

  for (let i = 0; i < nums.length - 3; i++) {
    if (i === 0 || nums[i] !== nums[i - 1]) {
      for (let j = i + 1; j < nums.length - 2; j++) {
        if (j === i + 1 || nums[j] !== nums[j - 1]) {
          let low = j + 1;
          let high = nums.length - 1;

          while (low < high) {
            if (nums[i] + nums[j] + nums[low] + nums[high] === target) {
              set.push([nums[i], nums[j], nums[low], nums[high]]);
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

  return set;
};

// 2) Longest Substring Without Repeating Characters

const lengthOfLongestSubstring = string => {
  let seen = {};
  let startIdx = 0;
  let length = 0;

  for (let i = 0; i < string.length; i++) {
    let char = string.charAt(i);

    if (char in seen && startIdx <= seen[char]) {
      startIdx = seen[char] + 1;
    } else {
      length = Math.max(length, i - startIdx + 1);
    }

    seen[char] = i;
  }

  return length;
};

// 3) Longest Common Prefix

const longestCommonPrefix = array => {
  if (array.length === 0) return "";
  let prefix = "";
  let current = array[0];

  for (let i = 0; i < current.length; i++) {
    for (let j = 1; j < array.length; j++) {
      if (!array[j][i] || current[i] !== array[j][i]) return prefix;
    }

    prefix += current[i];
  }

  return prefix;
};

// 4) Group Anagrams

function groupAnagrams(array) {
  let groups = {};
  let anagrams = [];

  for (let i = 0; i < array.length; i++) {
    let string = array[i].split("").sort().join("");
    
    if (string in groups) {
      groups[string].push(array[i]);
    } else {
      groups[string] = [array[i]];
    }
  }

  let anagram;
  for (anagram in groups) {
    anagrams.push(groups[anagram]);
  }

  return anagrams;
}

// 5) Merge Intervals

const merge = intervals => {
  let merged = [];
  if (intervals.length === 0) return merged;

  intervals = intervals.sort((a, b) => a.start - b.start);
  let current = intervals[0];

  for (let i = 1; i < intervals.length; i++) {
    let interval = intervals[i];

    if (current.end >= interval.start) {
      current = new Interval(current.start, Math.max(current.end, interval.end));
    } else {
      merged.push(current);
      current = interval;
    }
  }

  merged.push(current);
  return merged;
};

// 7) Word Ladder

// const ladderLength = (beginWord, endWord, wordList) => {
//   let visited = {};
//   let queue = [beginWord];
//   let count = 1;

//   while (queue.length !== 0 && count < wordList.length) {
//     let current = queue.shift();

//     if (Array.isArray(current)) {
//       count = current[1];
//       current = current[0];
//     }

//     for (let i = 0; i < wordList.length; i++) {
//       let word = wordList[i];
      
//       if (!visited[word] && oneLetterAway(word, current)) {
//         queue.push([word, count + 1]);
//         visited[word] = true;

//         if (word === endWord) return count + 1;
//       }
//     }
//   }

//   return 0;
// };

// const oneLetterAway = (word1, word2) => {
//   let difference = Math.abs(word1.length - word2.length);
//   if (difference > 1) return false;
//   let shorterWord = word1.length > word2.length ? word2 : word1;

//   for (let i = 0; i < shorterWord.length; i++) {
//     if (word1.charAt(i) !== word2.charAt(i)) difference++;
//     if (difference > 1) return false;
//   }

//   return true;
// };

const ladderLength = (beginWord, endWord, wordList) => {
  wordList = createHashMap(wordList);

  let visited = {};
  let queue = [[beginWord, 1]];

  while (queue.length !== 0) {
    let current = queue.shift();
    let word = current[0];
    let count = current[1];

    for (let i = 0; i < word.length; i++) {
      let string = word.slice(0, i) + "_" + word.slice(i + 1);
      let neighbors = wordList[string];

      if (neighbors) {
        for (let j = 0; j < neighbors.length; j++) {
          let neighbor = neighbors[j];

          if (!visited[neighbor]) {
            if (neighbor === endWord) return count + 1;

            visited[neighbor] = true;
            queue.push([neighbor, count + 1]);
          }
        }
      }
    }
  }

  return 0;
};

const createHashMap = (wordList) => {
  let hashMap = {};

  for (let i = 0; i < wordList.length; i++) {
    let word = wordList[i];

    for (let j = 0; j < word.length; j++) {
      let string = word.slice(0, j) + "_" + word.slice(j + 1);

      if (!hashMap[string]) {
        hashMap[string] = [word];
      } else {
        hashMap[string].push(word);
      }
    }
  }

  return hashMap;
};

// 8) Reverse Words in a String

const reverseWords = str => {
  return str.trim().split(/\s+/).reverse().join(" ");
};

// 9) Isomorphic Strings

const isIsomorphic = (str1, str2) => {
  if (str1.length !== str2.length) return false;

  let pairs = {};
  let seen = {};

  for (let i = 0; i < str1.length; i++) {
    let c1 = str1.charAt(i);
    let c2 = str2.charAt(i);

    if (seen[c2] || c1 in pairs) {
      if (pairs[c1] !== c2) return false;
    }

    if (!pairs[c1]) pairs[c1] = c2;
    
    seen[c2] = true;
  }

  return true;
};

// 10a) Reverse Linked List BFS

const reverseList = head => {
  let prev = null;

  while (head) {
    let current = head;
    head = head.next;
    current.next = prev;
    prev = current;
  }

  return prev;
};

// 10b) Reverse Linked List DFS

const reverseList = (head, prev = null) => {
  if (!head) return prev;

  let current = head;
  head = head.next;
  current.next = prev;

  return reverseList(head, current);
};

// 11) Course Schedule

const canFinish = (numCourses, prerequisites) => {
  let inEdgesCount = {};
  let outEdges = {};
  
  for (let i = 0; i < prerequisites.length; i++) {
    let c1 = prerequisites[i][0];
    let c2 = prerequisites[i][1];

    if (!inEdgesCount[c1]) inEdgesCount[c1] = 0;
    if (!outEdges[c1]) {
      outEdges[c1] = [c2];
    } else {
      outEdges[c1].push(c2);
    }

    if (!inEdgesCount[c2]) {
      inEdgesCount[c2] = 1;
    } else {
      inEdgesCount[c2]++;
    }
  }

  let queue = [];
  let key;
  for (key in inEdgesCount) {
    if (inEdgesCount[key] === 0) queue.push(key);
  }

  while (queue.length !== 0) {
    let current = queue.shift();
    
    let edges = outEdges[current];
    if (edges) {
      for (let i = 0; i < edges.length; i++) {
        let edge = edges[i];
        inEdgesCount[edge]--;
        
        if (inEdgesCount[edge] === 0) queue.push(edge);
      }
    }
  }

  for (key in inEdgesCount) {
    if (inEdgesCount[key] !== 0) return false;
  }

  return true;
};

// 13) Invert Binary Tree

const invertTree = root => {
  if (!root) return root;

  let temp = root.left;
  root.left = invertTree(root.right);
  root.right = invertTree(temp);

  return root;
};

// 14) Valid Anagram

const isAnagram = (s, t) => {
  if (s.length !== t.length) return false;
  let count = {};

  for (let i = 0; i < s.length; i++) {
    if (count[s[i]]) {
      count[s[i]]++;
    } else {
      count[s[i]] = 1;
    }

    if (count[t[i]]) {
      count[t[i]]--;
    } else {
      count[t[i]] = -1;
    }
  }

  let char;
  for (char in count) {
    if (count[char] !== 0) return false;
  }

  return true;
};










