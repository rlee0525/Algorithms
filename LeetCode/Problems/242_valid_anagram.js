const isAnagram = (s, t) => {
  if (s.length !== t.length) return false;

  let charCount = {};

  for (let i = 0; i < s.length; i++) {
    if (charCount[s.charAt(i)]) {
      charCount[s.charAt(i)]++;
    } else {
      charCount[s.charAt(i)] = 1;
    }

    if (charCount[t.charAt(i)]) {
      charCount[t.charAt(i)]--;
    } else {
      charCount[t.charAt(i)] = -1;
    }
  }

  let char;

  for (char in charCount) {
    if (charCount[char] !== 0) return false;
  }

  return true;
};

let s = "anagram";
let t = "nagaram";

console.log(isAnagram(s, t) === true);