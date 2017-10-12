// Debounce
// const saveDraft = () => {
//   let timeOut;
//   let input = document.getElementById("review-input").value;
//   clearTimeout(timeOut);

//   timeOut = setTimeout(() => {
//     console.log(input);
//   }, 3000);
// };

// document.addEventListener("DOMContentLoaded", () => {
//   document.getElementById("review-input").onkeyup = () => saveDraft();
// });

// Second Smallest
const secondSmallest = arr => {
  let first = 1.0/0.0;
  let second = 1.0/0.0;

  for (let i = 0; i < arr.length; i++) {
    if (arr[i] < first) {
      second = first;
      first = arr[i];
    } else if (arr[i] < second) {
      second = arr[i];
    }
  }

  return second;
};

console.log(secondSmallest([2, 10, 4, 35, -1, 20, 33, 100]) === 2);

// Parse Object
const parseObj = obj => {
  let res = [];

  Object.keys(obj).forEach(k => {
    if (typeof obj[k] === "string") {
      res.push(obj[k]);
    } else if (typeof obj[k] === "object") {
      res.push(parseObj(obj[k]));
    } else {
      res.push("");
    }
  });

  return res.join(", ");
};

let json = {
  "Name": "Raymond Lee",
  "Position": "Software Engineer",
  "Details": {
    "id": "25",
    "Alma mater": "Northwestern University",
    "Nothing": 300
  }
};

console.log(parseObj(json) === "Raymond Lee, Software Engineer, 25, Northwestern University, ");

// two pointer two sum
const twoSum = function(nums, target) {
  nums = nums.sort((a, b) => a - b);

  let low = 0;
  let high = nums.length - 1;

  while (low < high) {
    if (nums[low] + nums[high] === target) {
      return true;
    } else if (nums[low] + nums[high] < target) {
      low++;
    } else {
      high--;
    }
  }

  return false;
};

// faster two sum
const twoSum = (nums, target) => {
  let seen = {};

  for (let i = 0; i < nums.length; i++) {
    if (nums[i] in seen) return [seen[nums[i]], i];
    seen[target - nums[i]] = i;
  }

  return false;
};

const threeSum = (arr, target) => {
  arr = arr.sort((a, b) => a - b);
  let set = [];

  for (let i = 0; i < arr.length; i++) {
    if (i === 0 || arr[i] !== arr[i - 1]) {
      let low = i + 1;
      let high = arr.length - 1;

      while (low < high) {
        if (arr[i] + arr[low] + arr[high] === target) {
          set.push([arr[i], arr[low], arr[high]]);
          low++;
          high--;

          while (arr[low] === arr[low - 1]) low++;
          while (arr[high] === arr[high + 1]) high--;
        } else if (arr[i] + arr[low] + arr[high] < target) {
          low++;
        } else {
          high--;
        }
      }
    }
  }

  return set;
};

const fourSum = (nums, target) => {
  nums = nums.sort((a, b) => a - b);
  let set = [];

  for (let i = 0; i < nums.length; i++) {
    if (i === 0 || nums[i] !== nums[i - 1]) {
      for (let j = i + 1; j < nums.length; j++) {
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
            } else if (nums[i] + nums[j] + nums[low] + nums[high] < target) {
              low++;
            } else {
              high--;
            }
          }
        }
      }
    }
  }

  return set;
};

// longest substring without repeating characters

const lengthOfLongestSubstring = string => {
  let seen = {};
  let startIdx = 0;
  let count = 0;

  for (let i = 0; i < string.length; i++) {
    if (string[i] in seen && seen[string[i]] >= startIdx) {
      startIdx = seen[string[i]] + 1;
    } else {
      count = Math.max(count, i - startIdx + 1);
    }

    seen[string[i]] = i;
  }

  return count;
};












