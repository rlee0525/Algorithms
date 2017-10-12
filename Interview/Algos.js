// Debounce
// const saveDraft = () => {
//   let timeOut;
//   let input = document.getElementById("review-input").value;
//   clearTimeout(timeOut);

//   timeOut = setTimeout(() => {
//     console.log(input);
//   }, 3000);
// };

// document.addEventListener("DOMContentLoaded", () => {
//   document.getElementById("review-input").onkeyup = () => saveDraft();
// });

// Second Smallest
const secondSmallest = arr => {
  let first = 1.0/0.0;
  let second = 1.0/0.0;

  for (let i = 0; i < arr.length; i++) {
    if (arr[i] < first) {
      second = first;
      first = arr[i];
    } else if (arr[i] < second) {
      second = arr[i];
    }
  }

  return second;
};

console.log(secondSmallest([2, 10, 4, 35, -1, 20, 33, 100]) === 2);

// Parse Object
const parseObj = obj => {
  let res = [];

  Object.keys(obj).forEach(k => {
    if (typeof obj[k] === "string") {
      res.push(obj[k]);
    } else if (typeof obj[k] === "object") {
      res.push(parseObj(obj[k]));
    } else {
      res.push("");
    }
  });

  return res.join(", ");
};

let json = {
  "Name": "Raymond Lee",
  "Position": "Software Engineer",
  "Details": {
    "id": "25",
    "Alma mater": "Northwestern University",
    "Nothing": 300
  }
};

console.log(parseObj(json) === "Raymond Lee, Software Engineer, 25, Northwestern University, ");