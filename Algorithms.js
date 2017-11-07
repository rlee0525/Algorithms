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

// Medium

// Hard