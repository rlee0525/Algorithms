// Time Complexity O(N)
// Space Complexity O(N)
const isUnique = (string) => {
  let set = new Set();

  for (let i = 0; i < string.length; i++) {
    if (set.has(string[i])) {
      return false;
    } else {
      set.add(string[i]);
    }
  }

  return true;
}

console.log(isUnique("hello") === false);
console.log(isUnique("helowpqi") === true);

// Time Complexity O(N^2)
// Space Complexity O(1)
const isUnique2 = (string) => {
  for (let i = 0; i < string.length; i++) {
    for (var j = i + 1; j < string.length; j++) {
      if (string[i] === string[j]) {
        return false;
      }
    }
  }

  return true;
}

console.log(isUnique2("hello") === false);
console.log(isUnique2("helowpqi") === true);
