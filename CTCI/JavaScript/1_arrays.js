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

const palindromePermutation = string => {
  let count = {};

  for (var i = 0; i < string.length; i++) {
    count[string[i]] ? count[string[i]]++ : count[string[i]] = 1;
  }

  let oddCount = 0;

  for (key in count) {
    if (count[key] % 2 === 1) {
      oddCount++;
      if (oddCount > 1) {
        return false;
      }
    }
  }

  return true;
}

console.log(palindromePermutation("tacoatc") == true);
console.log(palindromePermutation("tacoatcz") == false);


const oneEditAway = (str1, str2) => {
  if (str1 === str2) {
    return true;
  }

  if (Math.abs(str1.length - str2.length) > 1) {
    return false;
  }

  if (str1.length == str2.length) {
    return sameLength(str1, str2);
  } else {
    let shorter;
    let longer;

    if (str1.length < str2.length) {
      shorter = str1;
      longer = str2;
    } else {
      shorter = str2;
      longer = str1;
    }
    return differentLength(longer, shorter);
  }
}

const sameLength = (str1, str2) => {
  let difference = 0;
  for (var i = 0; i < str1.length; i++) {
    if (str1[i] != str2[i]) {
      difference++;
      if (difference > 1) {
        return false;
      }
    }
  }

  return true;
}

const differentLength = (longer, shorter) => {
  let idx1 = 0;
  let idx2 = 0;

  while (idx1 < longer.length && idx2 < shorter.length) {
    if (longer[idx1] !== shorter[idx2]) {
      if (idx1 !== idx2) {
        return false;
      }

      idx1++;
      continue;
    }
    idx1++;
    idx2++;
  }

  return true;
}

console.log(oneEditAway("pale", "ple") === true);
console.log(oneEditAway("pales", "pale") === true);
console.log(oneEditAway("pale", "bale") === true);
console.log(oneEditAway("pale", "bae") === false);
console.log(oneEditAway("pale", "pale") === true);
console.log(oneEditAway("pale", "pa") === false);
console.log(oneEditAway("pale", "jal") === false);

const stringCompression = string => {
  let compressed = string[0];
  let count = 1;

  for (let i = 1; i < string.length; i++) {
    if (string[i] !== compressed[compressed.length - 1]) {
      let stringCount = count.toString();
      compressed = compressed.concat(stringCount);
      compressed = compressed.concat(string[i]);
      count = 1;
    } else {
      count++;
    }

    if (i === string.length - 1) {
      let stringCount = count.toString();
      compressed = compressed.concat(stringCount);
    }
  }

  if (compressed.length < string.length) {
    return compressed;
  } else {
    return string;
  }
}

console.log(stringCompression("aabcccccaaa") == "a2b1c5a3");
console.log(stringCompression("aabccccca") == "a2b1c5a1");
console.log(stringCompression("aabbcc") == "aabbcc");

const rotateMatrix = (matrix) => {
  for (let row = 0; row < matrix.length; row++) {
    let col = row + 1;

    while (col < matrix.length) {
      let temp = matrix[row][col];

      matrix[row][col] = matrix[col][row];
      matrix[col][row] = temp;

      col++;
    }
  }

  for (let row = 0; row < matrix.length; row++) {
    let start_col = 0;
    let end_col = matrix.length - 1;

    while (start_col < end_col) {
      let temp = matrix[row][start_col];
      matrix[row][start_col] = matrix[row][end_col];
      matrix[row][end_col] = temp;

      start_col++;
      end_col--;
    }
  }

  return matrix;
}

console.log(rotateMatrix([[1, 2, 3], [4, 5, 6], [7, 8, 9]])); // [ [ 7, 4, 1 ], [ 8, 5, 2 ], [ 9, 6, 3 ] ]);
console.log(rotateMatrix([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]])); // [[13, 9, 5, 1], [14, 10, 6, 2], [15, 11, 7, 3], [16, 12, 8, 4]]);

const zeroMatrix = matrix => {
  for (let row = 0; row < matrix.length; row++) {
    for (let col = 0; col < matrix[0].length; col++) {
      if (matrix[row][col] === 0) {
        matrix[row][0] = 0;
        matrix[0][col] = 0;
      }
    }
  }

  for (let row = 1; row < matrix.length; row++) {
    for (let col = 1; col < matrix[0].length; col++) {
      if (matrix[row][0] === 0 || matrix[0][col] === 0) {
        matrix[row][col] = 0;
      }
    }
  }

  return matrix
}

console.log(zeroMatrix([[1, 2, 3], [4, 0, 6], [7, 8, 9]])); //== [[1, 0, 3], [0, 0, 0], [7, 0, 9]]);
console.log(zeroMatrix([[2, 3, 4], [6, 7, 8], [10, 11, 12], [14, 15, 0]])); //== [[2, 3, 0], [6, 7, 0], [10, 11, 0], [0, 0, 0]]);

const stringRotation = (str1, str2) => {
  let newString = str1.concat(str1);
  return isSubstring(newString, str2);
}

const isSubstring = (str1, str2) => {
  return str1.includes(str2)
}

console.log(isSubstring("Hello", "olHle") == false);
console.log(isSubstring("Hello", "ello") == true);
console.log(stringRotation("waterbottle", "erbottlewat") == true);
