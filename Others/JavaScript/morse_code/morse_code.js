/**
 * Morse Code Translator
 *
 * Letters should be broken up with a space.
 * Feel free to use any process for differentiating the space between letters and words
 *     I recommend something like a / or | between words; ie 'DOG CAT' => '-.. --- --. / -.- .- -'
 *
 * Also feel free to modify this code or the HTML as much as needed.  You do not need to use this structure.
 * http://safetybelt.pythonanywhere.com/letters/
**/

const getMorse = (string) => {
  let iter = [];

  for (var i = 0; i < string.length; i++) {
    iter.push(grabData(string[i]));
  }

  let new_str = "";

  for (var i = 0; i < iter.length; i++) {
    iter[i].then(res => {
      new_str += res.code;
      getOutput(new_str);
    });
  }
}

const getOutput = (string) => {
  document.getElementById("result").innerHTML = string;
}

const getInput = () => {
  let string = document.getElementById("string").value;

  getMorse(string);
}

const grabData = (char) => {
  return $.get(`http://safetybelt.pythonanywhere.com/letters/${char}`);
}

document.getElementById("submit").addEventListener("click", e => {
  e.preventDefault();
  getInput();
});
