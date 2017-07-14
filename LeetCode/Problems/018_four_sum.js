const fourSum = (nums, target) => {
  let solutionSet = [];

  nums = nums.sort((a, b) => a - b);

  for (let i = 0; i < nums.length - 3; i++) {
    if (i === 0 || nums[i] !== nums[i - 1]) {
      for (let j = i + 1; j < nums.length - 2; j++) {
        if ( j === i + 1 || nums[j] !== nums[j - 1]) {
          let low = j + 1;
          let high = nums.length - 1;

          while (low < high) {
            if (nums[i] + nums[j] + nums[low] + nums[high] === target) {
              solutionSet.push([nums[i], nums[j], nums[low], nums[high]]);
              low++;
              high--;

              while (nums[low] === nums[low - 1]) low++;
              while (nums[high] === nums[high + 1]) high--;
            } else if (nums[i] + nums[j] + nums[low] + nums[high] > target) {
              high--;
            } else {
              low++;
            }
          }
        }
      }
    }
  }

  return solutionSet;
};

let nums = [1, 0, -1, 0, -2, 2];
let target = 0;

console.log(fourSum(nums, target));