function twoSum(nums, target) {
  let seen = {};

  for (let i = 0; i < nums.length; i++) {
    let num = nums[i];

    if (num in seen) {
      return [seen[num], i];
    } else {
      seen[target - num] = i;
    }
  }
}

let nums = [2, 4, 10, 15];
let target = 6;

console.log(twoSum(nums, target));