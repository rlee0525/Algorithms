const mergeIntervals = array => {
  if (array.length === 0) return [];

  array = array.sort((a, b) => a[0] - b[0]);
  let mergedIntervals = [];
  let currentInterval = array[0];

  for (let i = 1; i < array.length; i++) {
    if (currentInterval[1] >= array[i][0]) {
      currentInterval = [currentInterval[0], Math.max(currentInterval[1], array[i][1])];
    } else {
      mergedIntervals.push(currentInterval);
      currentInterval = array[i];
    }
  }

  mergedIntervals.push(currentInterval);

  return mergedIntervals;
};

let array = [[1, 3], [2, 6], [8, 10], [15, 18]];
console.log(mergeIntervals(array));