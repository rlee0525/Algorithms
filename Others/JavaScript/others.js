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

// console.log(add(6, 10, 5, 2)(5, 20)(10));

const addNum = (...args) => {
  let sum = 0;
  for (var i = 0; i < args.length; i++) {
    sum += args[i];
  }

  const _curry = (...nums) => {
    if (nums.length === 0) {
      return sum;
    } else {
      for (var i = 0; i < nums.length; i++) {
        sum += nums[i];
      }

      return _curry;
    }
  }

  return _curry;
}

let curried = addNum(6, 10, 5, 2)(5, 20)(10);

const typeCheck = (fn) => {
  if (typeof fn === "function") {
    return fn();
  } else {
    return fn;
  }
}

console.log(typeCheck(curried));
