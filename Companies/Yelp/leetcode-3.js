// 1a) 2sum

const twoSum = (nums, target) => {
  let hash = {};

  for (let i = 0; i < nums.length; i++) {
    if (nums[i] in hash) return [hash[nums[i]], i];

    hash[target - nums[i]] = i;
  }
};

// 1b) 3sum

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
          high--;
          low++;

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

// 1c) 4sum

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

// 2) longest substring without repeating characters

const lengthOfLongestSubstring = string => {
  let seen = {};
  let startIdx = 0;
  let count = 0;

  for (let i = 0; i < string.length; i++) {
    let char = string[i];

    if (char in seen && startIdx <= seen[char]) {
      startIdx = seen[char] + 1;
    } else {
      count = Math.max(count, i - startIdx + 1);
    }

    seen[char] = i;
  }

  return count;
};

// 3) Longest common prefix

const longestCommonPrefix = array => {
  let prefix = "";
  if (array.length < 1) return prefix;
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

const groupAnagrams = array => {
  let groups = {};

  for (let i = 0; i < array.length; i++) {
    let current = array[i].split("").sort().join("");

    if (groups[current]) {
      groups[current].push(array[i]);
    } else {
      groups[current] = [array[i]];
    }
  }

  let group;
  let solution = [];
  for (group in groups) {
    solution.push(groups[group]);
  }

  return solution;
};

// 5) Merge Intervals

class Interval {
  constructor(start, end) {
    this.start = start;
    this.end = end;
  }
}

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

// 6) Word Ladder II

// const findLadders = (beginWord, endWord, wordList) => {
//   wordList = createDictionary2(wordList);
//   let queue = [[beginWord, 1, {}, [beginWord]]];
//   let paths = [];
//   let findMin = false;

//   while (queue.length !== 0) {
//     let current = queue.shift();
//     let word = current[0];
//     let count = current[1];

//     for (let i = 0; i < word.length; i++) {
//       let sliced = word.slice(0, i) + "_" + word.slice(i + 1);
//       let neighbors = wordList[sliced];

//       if (neighbors) {
//         for (let j = 0; j < neighbors.length; j++) {
//           let visited = current[2];
//           let path = current[3];
//           let neighbor = neighbors[j];

//           if (!visited[neighbor]) {
//             visited[neighbor] = true;
//             path.push(neighbor);
//             queue.push([neighbor, count + 1, visited, path]);

//             if (neighbor === endWord && !findMin) {
//               findMin = true;
//               paths.push(path);
//               console.log(paths);
//             } else if (neighbor === endWord && findMin) {
//               return paths;
//             }
//           }
//         }
//       }
//     }
//   }

//   return 0;
// };

// const createDictionary2 = wordList => {
//   let dictionary = {};

//   for (let i = 0; i < wordList.length; i++) {
//     let word = wordList[i];

//     for (let j = 0; j < word.length; j++) {
//       let sliced = word.slice(0, j) + "_" + word.slice(j + 1);

//       if (sliced in dictionary) {
//         dictionary[sliced].push(word);
//       } else {
//         dictionary[sliced] = [word];
//       }
//     }
//   }

//   return dictionary;
// };

// 7) Word Ladder

// const ladderLength = (beginWord, endWord, wordList) => {
//   let queue = [beginWord];
//   let count = 1;
//   let visited = {};

//   while (queue.length !== 0 && count < wordList.length) {
//     let current = queue.shift();
    
//     if (Array.isArray(current)) {
//       count = current[1];
//       current = current[0];
//     }

//     for (let i = 0; i < wordList.length; i++) {
//       let word = wordList[i];

//       if (!visited[word] && oneChangeAway(word, current)) {
//         queue.push([word, count + 1]);
//         visited[word] = true;

//         if (word === endWord) return count + 1;
//       }
//     }
//   }

//   return 0;
// };

// const oneChangeAway = (word1, word2) => {
//   let difference = Math.abs(word1.length - word2.length);
//   if (difference > 1) return false;
//   let shorter = word1.length > word2.length ? word2 : word1;

//   for (let i = 0; i < shorter.length; i++) {
//     if (word1.charAt(i) !== word2.charAt(i)) difference++;
//   }

//   return difference <= 1;
// };

const ladderLength = (beginWord, endWord, wordList) => {
  wordList = createDictionary(wordList);
  let queue = [[beginWord, 1]];
  let visited = {};

  while (queue.length !== 0) {
    let current = queue.shift();
    let count = current[1];
    let word = current[0];

    for (let i = 0; i < word.length; i++) {
      let sliced = word.slice(0, i) + "_" + word.slice(i + 1);
      let neighbors = wordList[sliced];

      if (neighbors) {
        for (let j = 0; j < neighbors.length; j++) {
          let neighbor = neighbors[j];

          if (!visited[neighbor]) {
            if (neighbor === endWord) return count + 1;

            queue.push([neighbor, count + 1]);
            visited[neighbor] = true;
          }
        }
      }
    }
  }

  return 0;
};

const createDictionary = (wordList) => {
  let dictionary = {};

  for (let i = 0; i < wordList.length; i++) {
    let word = wordList[i];

    for (let j = 0; j < word.length; j++) {
      let sliced = word.slice(0, j) + "_" + word.slice(j + 1);

      if (dictionary[sliced]) {
        dictionary[sliced].push(word);
      } else {
        dictionary[sliced] = [word];
      }
    }
  }

  return dictionary;
};

// 8) Reverse words in a string

const reverseWords = str => {
  return str.trim().split(/\s+/).reverse().join(" ");
};

// 9) Isomorphic Strings

const isIsomorphic = (str1, str2) => {
  if (str1.length !== str2.length) return false;

  let pairs = {};
  let seen2 = {};

  for (let i = 0; i < str1.length; i++) {
    let c1 = str1[i];
    let c2 = str2[i];

    if (seen2[c2] || pairs[c1]) {
      if (pairs[c1] !== c2) return false;
    }

    pairs[c1] = c2;
    seen2[c2] = true;
  }

  return true;
};

// 10) Reverse linked list

// const reverseList = head => {
//   let prev = null;

//   while (head) {
//     let current = head;
//     head = head.next;
//     current.next = prev;
//     prev = current;
//   }

//   return prev;
// };

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
    let pair = prerequisites[i];

    if (!inEdgesCount[pair[0]]) inEdgesCount[pair[0]] = 0;
    if (!inEdgesCount[pair[1]]) {
      inEdgesCount[pair[1]] = 1;
    } else {
      inEdgesCount[pair[1]]++;
    }

    if (!outEdges[pair[0]]) {
      outEdges[pair[0]] = [pair[1]];
    } else {
      outEdges[pair[0]].push(pair[1]);
    }
  }

  let queue = [];
  let edge;

  for (edge in inEdgesCount) {
    if (inEdgesCount[edge] === 0) queue.push(edge);
  }

  while (queue.length !== 0) {
    let current = queue.shift();
    let out = outEdges[current];

    if (out) {
      for (let i = 0; i < out.length; i++) {
        inEdgesCount[out[i]]--;

        if (inEdgesCount[out[i]] === 0) {
          queue.push(out[i]);
        }
      }
    }
  }

  let key;
  for (key in inEdgesCount) {
    if (inEdgesCount[key] !== 0) return false;
  }

  return true;
};

// 12) Skyline Problem

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

  let hash = {};

  for (let i = 0; i < s.length; i++) {
    if (hash[s[i]]) {
      hash[s[i]]++;
    } else {
      hash[s[i]] = 1;
    }

    if (hash[t[i]]) {
      hash[t[i]]--;
    } else {
      hash[t[i]] = -1;
    }
  }

  let key;
  for (key in hash) {
    if (hash[key] !== 0) return false;
  }

  return true;
};














