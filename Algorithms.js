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

// 4) GG BFS for a Graph
class simpleGraphBFS {
  constructor() {
    this.graph = {};
  }

  addEdge(s, e) {
    if (s in this.graph) {
      this.graph[s].push(e);
    } else {
      this.graph[s] = [e];
    }
  }

  graphBFS(s) {
    let queue = [s];
    let res = [];
    let visited = {};

    while (queue.length !== 0) {
      let current = queue[0];
      queue = queue.slice(1, queue.length);
      res.push(current);
      visited[current] = true;

      for (let i = 0; i < this.graph[current].length; i++) {
        if (!(this.graph[current][i] in visited)) {
          queue.push(this.graph[current][i]);
        }
      }
    }

    return res;
  }
}

let g = new simpleGraphBFS();
g.addEdge(0, 1);
g.addEdge(0, 2);
g.addEdge(1, 2);
g.addEdge(2, 0);
g.addEdge(2, 3);
g.addEdge(3, 3);

console.log(g.graphBFS(2)); // [2, 0, 3, 1]

// 5) GG DFS for a graph
class simpleGraphDFS {
  constructor() {
    this.edges = {};
  }

  addEdge(s, e) {
    if (s in this.edges) {
      this.edges[s].push(e);
    } else {
      this.edges[s] = [e];
    }
  }

  graphDFS(s) {
    let res = [];
    this._utilDFS(s, res);
    return res;
  }

  _utilDFS(s, res, visited = {}) {
    res.push(s);
    visited[s] = true;
    
    for (let i = 0; i < this.edges[s].length; i++) {
      let current = this.edges[s][i];

      if (!(current in visited)) {
        this._utilDFS(current, res, visited);
      }
    }
  }
}

let g2 = new simpleGraphDFS();
g2.addEdge(0, 1);
g2.addEdge(0, 2);
g2.addEdge(1, 2);
g2.addEdge(2, 0);
g2.addEdge(2, 3);
g2.addEdge(3, 3);

console.log(g2.graphDFS(2)); // [2, 0, 1, 3]

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
  let total = arr1.length + arr2.length;
  let left = getKth(arr1, arr2, Math.floor((total - 1) / 2));
  let right = getKth(arr1, arr2, Math.floor(total / 2));

  return (left + right) / 2;
};

const getKth = (arr1, arr2, k) => {
  if (arr1.length > arr2.length) return getKth(arr2, arr1, k);
  if (arr1.length === 0) return arr2[k];
  if (k === (arr1.length + arr2.length - 1)) {
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

// 2) Get Lowest Price
class Interval {
  constructor(startTime, endTime, price) {
    this.startTime = startTime;
    this.endTime = endTime;
    this.price = price;
  }
}

class BinaryTree {
  constructor(interval) {
    this.interval = interval;
  }

  addNode(interval) {
    if (interval.startTime < this.interval.startTime) {
      let newInterval = new Interval(interval.startTime, Math.min(interval.endTime, this.interval.startTime), interval.price);

      if (this.left) {
        this.left.addNode(newInterval);
      } else {
        this.left = new BinaryTree (newInterval);
      }
    }

    if (interval.endTime > this.interval.endTime) {
      let newInterval = new Interval(Math.max(interval.startTime, this.interval.endTime), interval.endTime, interval.price);

      if (this.right) {
        this.right.addNode(newInterval);
      } else {
        this.right = new BinaryTree(newInterval);
      }
    }
  }

  _traverse(results) {
    if (this.left) {
      this.left._traverse(results);
    }

    results.push(this.interval);

    if (this.right) {
      this.right._traverse(results);
    }
  }

  inOrder() {
    let results = [];
    this._traverse(results);
    return results;
  }
}

const getLowestPrices = inputIntervals => {
  inputIntervals = inputIntervals.sort((a, b) => a.price - b.price);
  let tree = new BinaryTree(inputIntervals[0]);

  for (let i = 1; i < inputIntervals.length; i++) {
    tree.addNode(inputIntervals[i]);
  }

  return tree.inOrder();
};


let sampleInput = [new Interval(1, 5, 20), new Interval(3, 4, 15)];
let sampleInput2 = [new Interval(1, 5, 20), new Interval(1, 5, 15)];
let sampleInput3 = [new Interval(1, 5, 20), new Interval(2, 5, 17), new Interval(4, 6, 15)];
console.log(getLowestPrices(sampleInput)); // [new Interval(1, 3, 20), new Interval(3, 4, 15), new Interval(4, 5, 20)]
console.log(getLowestPrices(sampleInput2)); // [new Interval(1, 5, 15)]
console.log(getLowestPrices(sampleInput3)); // [new Interval(1, 2, 20), new Interval(2, 4, 17), new Interval(4, 6, 15)]














