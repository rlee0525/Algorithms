const threeSum = nums => {
  let solutionSet = [];

  nums = nums.sort((a, b) => a - b);
  
  for (let i = 0; i < nums.length - 2; i++) {
    if (i === 0 || nums[i] !== nums[i - 1]) {
      let low = i + 1;
      let high = nums.length - 1;

      while (low < high) {
        if (nums[i] + nums[low] + nums[high] === 0) {
          solutionSet.push([nums[i], nums[low], nums[high]]);
          low++;
          high--;

          while (nums[low] === nums[low - 1]) low++;
          while (nums[high] === nums[high + 1]) high--;
        } else if (nums[i] + nums[low] + nums[high] > 0) {
          high--;
        } else {
          low++;
        }
      }
    }
  }

  return solutionSet;
};

let nums = [-1, 0, 1, 2, -1, -4];
console.log(threeSum(nums));