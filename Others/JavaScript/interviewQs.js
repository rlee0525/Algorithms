// Given an array of integers, find the largest product yielded from three of the integers

// 3 largest
// 2 min with 1 largest
// Time: O(N log N) // Space: O(N)
const largestProduct = array => {
  let sortedArr = array.sort((a, b) => a - b);
  let lastIndex = array.length - 1;

  let optionOne = sortedArr[0] * sortedArr[1] * sortedArr[lastIndex];
  let optionTwo = sortedArr[lastIndex] * sortedArr[lastIndex - 1] * sortedArr[lastIndex - 2];

  return optionOne > optionTwo ? optionOne : optionTwo;
}

console.log(largestProduct([-10, 7, 29, 30, 5, -10, -70]));

// Time: O(N) // Space: O(1)
const largestProductTwo = array => {
  let firstMin = null;
  let secondMin = null;
  let firstMax = null;
  let secondMax = null;
  let thirdMax = null;

  array.forEach(el => {
    if (!firstMax || el > firstMax) {
      thirdMax = secondMax;
      secondMax = firstMax;
      firstMax = el;
    } else if (!secondMax || el > secondMax) {
      thirdMax = secondMax;
      secondMax = el;
    } else if (!thirdMax || el > thirdMax) {
      thirdMax = el;
    } else if (!firstMin || el < firstMin) {
      secondMin = firstMin;
      firstMin = el;
    } else if (!secondMin || el < secondMin) {
      secondMin = el;
    }
  });

  let firstProduct = firstMin * secondMin * firstMax;
  let secondProduct = firstMax * secondMax * thirdMax;

  return firstProduct > secondProduct ? firstProduct : secondProduct;
}

console.log(largestProductTwo([-10, 7, 29, 30, 5, -10, -70]));
