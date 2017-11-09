// Easy
// 1) Second smallest in an array
const secondSmallest = arr => {
  let smallest = 1.0 / 0.0;
  let second = 1.0 / 0.0;

  for (let i = 0; i < arr.length; i++) {
    let num = arr[i];

    if (num <= smallest) {
      second = smallest;
      smallest = num;
    } else if (num < second) {
      second = num;
    }
  }

  return second;
};

console.log(secondSmallest([2, 10, 4, 35, -1, 20, 33, 100]) === 2);

// 2) Parse object unless it's a number
const parseObj = obj => {
  let res = [];
  let key;

  for (key in obj) {
    if (typeof obj[key] === 'string') {
      res.push(obj[key]);
    } else if (typeof obj[key] === 'object') {
      res.push(parseObj(obj[key]));
    } else {
      res.push("");
    }
  }

  return res.join(", ");
};

let json2 = {
  "Name": "Raymond Lee",
  "Position": "Software Engineer",
  "Details": {
    "id": "25",
    "Alma mater": "Northwestern University",
    "Random Num": 300
  }
};

console.log(parseObj(json2) === "Raymond Lee, Software Engineer, 25, Northwestern University, ");

// 3) Highest average test score and the student's name
const highestAverage = arr => {
  let scores = {};

  for (let i = 0; i < arr.length; i++) {
    let currentName = arr[i][0];
    let currentScore = arr[i][1];

    if (currentName in scores) {
      scores[currentName].push(currentScore);
    } else {
      scores[currentName] = [currentScore];
    }
  }

  let bestAverage = 0;
  let person, bestPerson;

  for (person in scores) {
    let currentAverage = 0;

    for (let i = 0; i < scores[person].length; i++) {
      currentAverage += parseInt(scores[person][i]);
    }

    currentAverage = currentAverage / scores[person].length;
    if (bestAverage <= currentAverage) {
      bestAverage = currentAverage;
      bestPerson = person;
    }
  }

  return [bestPerson, bestAverage];
};

let scores3 = [
  ["Charles", '100'],
  ["Adam", '35'],
  ["Susan", '55'],
  ["Charles", '50']
];

console.log(highestAverage(scores3)); // ['Charles', 75]

// Medium
// 1) Count Steps, 1, 2, or 3 steps at a time.
const countStepsRec = n => {
  if (n < 1) return 0;

  let steps = [1, 2, 4];

  if (n < 4) return steps[n - 1];

  return countStepsRec(n - 1) + countStepsRec(n - 2) + countStepsRec(n - 3);
};

console.log(countStepsRec(4) === 7);
console.log(countStepsRec(6) === 24);
console.log(countStepsRec(10) === 274);

const countSteps = (n, dp = {}) => {
  if (n < 1) return 0;
  
  dp[1] = 1;
  dp[2] = 2;
  dp[3] = 4;

  if (n in dp) return dp[n];
  dp[n] = countSteps(n - 1, dp) + countSteps(n - 2, dp) + countSteps(n - 3, dp);

  return dp[n];
};

console.log(countSteps(4) === 7);
console.log(countSteps(6) === 24);
console.log(countSteps(10) === 274);
console.log(countSteps(36) === 2082876103);

// Hard
// 1) Find median given two sorted arrays
const findMedianEasy = (arr1, arr2) => {
  let newArr = arr1.concat(arr2);
  newArr = newArr.sort((a, b) => a - b);
  let middle = Math.floor(newArr.length / 2);

  if (newArr.length % 2 === 0) {
    return (newArr[middle - 1] + newArr[middle]) / 2;
  } else {
    return (newArr[middle]);
  }
};

console.log(findMedianEasy([0, 1, 2, 3], [4, 5, 10]) === 3);
console.log(findMedianEasy([0, 1, 4, 5], [3, 10, 100]) === 4);
console.log(findMedianEasy([0, 1, 2, 4, 5], [3, 10, 100]) === 3.5);

const findMedianSortedArrays = (arr1, arr2) => {
  let len = arr1.length + arr2.length;
  return (getKth(arr1, arr2, Math.floor((len - 1) / 2)) + getKth(arr1, arr2, Math.floor(len / 2))) / 2;
};

const getKth = (arr1, arr2, k) => {
  if (arr1.length > arr2.length) return getKth(arr2, arr1, k);

  if (arr1.length === 0) return arr2[k];
  if (k === arr1.length + arr2.length - 1) {
    return Math.max(arr1[arr1.length - 1], arr2[arr2.length - 1]);
  }

  let mid1 = Math.floor(arr1.length / 2);
  let mid2 = k - mid1;

  if (arr1[mid1] < arr2[mid2]) {
    arr1 = arr1.slice(mid1, arr1.length);
    arr2 = arr2.slice(0, mid2);

    return getKth(arr1, arr2, mid2);
  } else {
    arr1 = arr1.slice(0, mid1);
    arr2 = arr2.slice(mid2, arr2.length);

    return getKth(arr1, arr2, mid1);
  }
};

console.log(findMedianSortedArrays([0, 1, 2, 3], [4, 5, 10]) === 3);
console.log(findMedianSortedArrays([0, 1, 4, 5], [3, 10, 100]) === 4);
console.log(findMedianSortedArrays([1, 2], [3, 4]) === 2.5);
console.log(findMedianSortedArrays([0, 1, 2, 4, 5], [3, 10, 100]) === 3.5);
console.log(findMedianSortedArrays([0], [1, 2, 3, 10, 100]) === 2.5);
console.log(findMedianSortedArrays([0, 1, 5, 7, 9, 10, 11, 12], [3, 4]) === 6);





















