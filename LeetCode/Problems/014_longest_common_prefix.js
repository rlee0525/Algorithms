// NlogN + NM
const longestCommonPrefix = array => {
  if (array.length === 0) return "";

  array = array.sort((a, b) => a.length - b.length);
  let shortestLength = array[0].length;
  let longest = "";

  for (let i = 0; i < shortestLength; i++) {
    let currentChar = array[0][i];

    for (let j = 1; j < array.length; j++) {
      if (array[j][i] !== currentChar) return longest;
    }

    longest += currentChar;
  }

  return longest;
};

// NM <- this is slower in Leetcode for some reason?
function longestCommonPrefix2(array) {
  if (array.length === 0 || array[0].length === 0) return "";
  
  let longest = "";
  let idx = 0;
  let valid = true;

  while (valid) {
    let currentChar = array[0][idx];

    for (let j = 0; j < array.length; j++) {
      if (!array[j][idx] || array[j][idx] !== currentChar) return longest;
    }

    longest += currentChar;
    idx += 1;
  }

  return longest;
}

let array = ["abcowqekopk", "abccccc", "abc", "abwqew"];
console.log(longestCommonPrefix(array));
console.log(longestCommonPrefix2(array));