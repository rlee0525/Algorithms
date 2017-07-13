const isIsomorphic = (str1, str2) => {
  let used = {};
  let seen = {};

  for (let i = 0; i < str1.length; i++) {
    let char = str1[i];
    if (used[char] && used[char] !== str2[i]) return false;
    if (!used[char] && seen[str2[i]]) return false;
    if (!used[char]) {
      used[char] = str2[i];
    }

    seen[str2[i]] = true;
  }

  return true;
};

console.log(isIsomorphic("egg", "add") === true);
console.log(isIsomorphic("foo", "bar") === false);
console.log(isIsomorphic("aba", "baa") === false);
console.log(isIsomorphic("paper", "title") === true);