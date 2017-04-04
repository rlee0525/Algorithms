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

const isPermutation = (string1, string2) => {
  if (string1.length != string2.length) {
    return false;
  }

  count = {}

  for (var i = 0; i < string1.length; i++) {
    count[string1[i]] ? count[string1[i]]++ : count[string1[i]] = 1;
    count[string2[i]] ? count[string2[i]]-- : count[string2[i]] = -1;
  }

  for (key in count) {
    if (count[key] !== 0) {
      return false;
    }
  }

  return true;
}

console.log(isPermutation("hello", "olehl") == true);
console.log(isPermutation("heewewello", "oqwqlehl") == false);

const URLify = string => (
  string.trim().replace(/ /g, "%20")
)

console.log(URLify("Mr John Smith       ") == "Mr%20John%20Smith");
