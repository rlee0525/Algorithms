const bubbleSort = (array) => {
  for (let i = 0; i < array.length; i++) {
    for (let j = i + 1; j < array.length; j++) {
      if (array[i] > array[j]) {
        let temp = array[i];
        array[i] = array[j];
        array[j] = temp;
      }
    }
  }

  return array;
}

console.log(bubbleSort([1,2,45,1,3,4,7,2,1,100,312]));

const mergeSort = (array) => {
  let len = array.length;

  if (array.length < 2) return array;

  let mid = Math.floor(len / 2);
  let left = mergeSort(array.slice(0, mid));
  let right = mergeSort(array.slice(mid));

  return merge(left, right);
}

const merge = (left, right) => {
  let result = [];

  while (left.length > 0 && right.length > 0) {
    if (left[0] > right[0]) {
      result.push(right.shift());
    } else {
      result.push(left.shift());
    }
  }

  return result.concat(left, right);
}

console.log(mergeSort([1,2,45,1,3,4,7,2,1,100,312]));
