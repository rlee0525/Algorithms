// Curry with length given

const add = (count, ...args) => {
  let iterations = 0;
  let sum = 0;

  for (var i = 0; i < args.length; i++) {
    sum += args[i]
    iterations += 1;
  }

  const _curry = (...nums) => {
    for (var i = 0; i < nums.length; i++) {
      sum += nums[i];
      iterations += 1;
    }

    if (iterations === count) {
      return sum;
    } else {
      return _curry;
    }
  }

  return _curry;
}

// 1) keep iteration count
// 2) call it again if not
// 3) add

console.log(add(6, 10, 5, 2)(5, 20)(10));
