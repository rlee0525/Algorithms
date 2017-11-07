// Easy
// 1) Second Smallest
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

// 2) Parse Object
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

// 3) Highest Average
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
// 1) Count Steps
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