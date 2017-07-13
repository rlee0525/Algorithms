const oneLetterAway = (word1, word2) => {
  if (Math.abs(word1.length - word2.length) > 1) return false;
  
  let shorterWord = word1.length > word2.length ? word2 : word1;
  let difference = Math.abs(word1.length - word2.length);

  for (let i = 0; i < shorterWord.length; i++) {
    if (word1.charAt(i) !== word2.charAt(i)) {
      difference++;
    }

    if (difference > 1) return false;
  }

  return true;
};

// console.log(oneLetterAway("abc", "ab") === true);
// console.log(oneLetterAway("abc", "a") === false);
// console.log(oneLetterAway("abc", "abc") === true);
// console.log(oneLetterAway("abc", "abd") === true);
// console.log(oneLetterAway("abc", "abbd") === false);

const ladderLength = (beginWord, endWord, wordList) => {
  let visited = {};
  let queue = [beginWord];
  let count = 1;

  while (queue.length !== 0 && count < wordList.length) {
    let currentWord = queue.shift();

    if (Array.isArray(currentWord)) {
      count = currentWord[1];
      currentWord = currentWord[0];
    }

    for (let i = 0; i < wordList.length; i++) {
      let word = wordList[i];

      if (!visited[word] && oneLetterAway(currentWord, word)) {
        visited[word] = true;
        queue.push([word, count + 1]);

        if (word === endWord) return count + 1;
      }
    }
  }

  return 0;
};

let beginWord = "hit";
let endWord = "cog";
let wordList = ["hot","dot","dog","lot","log","cog"];

console.log(ladderLength(beginWord, endWord, wordList));