// Source: https://github.com/kennymkchan/interview-questions-in-javascript

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

// Being told that an unsorted array contains (n - 1) of n consecutive numbers (where the bounds are defined), find the missing number in O(n) time
// Time: O(N) // Space: O(1)
const missingNum = (array, lowerBound, upperBound) => {
  let count = lowerBound;
  let totalSum = 0;
  let arraySum = 0;

  for (var i = 0; i < array.length; i++) {
    arraySum += array[i];
    totalSum += count;
    count += 1;
  }

  return totalSum + upperBound - arraySum;
}

console.log(missingNum([4, 2, 1, 5, 7, 10, 3, 9, 8], 1, 10)); // 6

// Removing duplicates of an array and returning an array of only unique elements
// Time: O(N) // Space: O(N)
const removeDuplicates = array => {
  let hash = {};
  let newArr = [];

  for (var i = 0; i < array.length; i++) {
    if (!hash[array[i]]) {
      newArr.push(array[i])
      hash[array[i]] = true;
    }
  }

  return newArr;
}

console.log(removeDuplicates([5, 2, 3, 10, 2, 1, 9, 5, 20])); // [5, 2, 3, 10, 1, 9, 20]

// Given an array of integers, find the largest difference between two elements such that the element of lesser value must come before the greater element
// Time: O(N) // Space: O(1)
const largestDiff = array => {
  let difference = -1;
  let minimum = array[0];
  let maximum = array[0];

  for (var i = 0; i < array.length - 1; i++) {
    let currentDiff = maximum - minimum;

    if (currentDiff > difference) {
      difference = currentDiff;
    }

    if (minimum > array[i]) {
      minimum = array[i];
      maximum = array[i + 1];
    } else {
      maximum = array[i];
    }
  }

  return difference;
}
//
// 1) iterate through the array
// 2) keep minimum
// 3) find maximum
// 4) store difference
// 5) reset minimum

console.log(largestDiff([7, 8, 4, 9, 9, 15, 3, 1, 10])); // 11
