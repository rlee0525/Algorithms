// // you can write to stdout for debugging purposes, e.g.
// // console.log('this is a debug message');
//
// function solution() {
//   let visibleString = "";
//
//   let tds = $('table tr td');
//   for (var i = 0; i < tds.length; i++) {
//     if (tds[i].style.color !== tds[i].style.backgroundColor) {
//       visibleString += tds[i].innerHTML;
//     }
//   }
//
//   return visibleString;
// }
//
// document.addEventListener("DOMContentLoaded", () => solution());

function solution(S) {
  let subStrings = [];
  let subString = "";

  for (var i = 0; i < S.length; i++) {
    if (/[a-z]/i.test(S[i])) {
      subString += S[i];
    } else {
      subStrings.push(subString);
      subString = "";
    }
  }

  subStrings.push(subString);

  let longestString = -1;
  let longestLength = -1;

  for (var i = 0; i < subStrings.length; i++) {
    if (/[A-Z]/.test(subStrings[i]) && subStrings[i].length > longestLength) {
      longestString = subStrings[i];
      longestLength = longestString.length;
    }
  }

  return longestLength;
}

console.log(solution("a0Ba"));
console.log(solution("a0bb"));
