const lengthOfLongestSubstring = string => {
  let startIdx = 0;
  let maxLength = 0;
  let seenChar = {};

  for (let i = 0; i < string.length; i++) {
    let char = string[i];

    if (char in seenChar && startIdx <= seenChar[char]) {
      startIdx = seenChar[char] + 1;
    } else {
      maxLength = Math.max(maxLength, i - startIdx + 1);
    }

    seenChar[char] = i;
  }

  return maxLength;
};

let string = "tmmzuxt";
console.log(lengthOfLongestSubstring(string));