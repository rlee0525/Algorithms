# Given a digit string, return all possible letter combinations that the number could represent.

# A mapping of digit to letters (just like on the telephone buttons) is given below.



# Input:Digit string "23"
# Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].

# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  return [] if digits.empty?

  letters = {
    1 => [""],
    2 => ["a", "b", "c"],
    3 => ["d", "e", "f"],
    4 => ["g", "h", "i"],
    5 => ["j", "k", "l"],
    6 => ["m", "n", "o"],
    7 => ["p", "q", "r", "s"],
    8 => ["t", "u", "v"],
    9 => ["w", "x", "y", "z"]
  }

  combinations = letters[digits[0].to_i].dup
  queue = []

  (1...digits.length).each do |idx|
    queue = combinations
    combinations = []

    until queue.empty?
      current = queue.shift
      letters[digits[idx].to_i].each do |val|
        combinations.push(current + val)
      end
    end
  end

  combinations
end