const groupAnagrams = (array) => {
  let anagrams = {};

  for (let i = 0; i < array.length; i++) {
    let currentString = array[i];
    let sortedStr = currentString.split("").sort();

    if (anagrams[sortedStr]) {
      anagrams[sortedStr].push(currentString);
    } else {
      anagrams[sortedStr] = [currentString];
    }
  }

  let groups = [];
  
  Object.keys(anagrams).forEach(key => groups.push(anagrams[key]));

  return groups;
};

let array = ["eat", "tea", "tan", "ate", "nat", "bat"];
console.log(groupAnagrams(array));

// [
//   ["ate", "eat","tea"],
//   ["nat","tan"],
//   ["bat"]
// ];