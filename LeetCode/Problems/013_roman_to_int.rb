# Given a roman numeral, convert it to an integer.

# Input is guaranteed to be within the range from 1 to 3999.

def roman_to_int(s)
  int = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  }

  idx = s.length - 1
  result = 0

  while idx >= 0
    if int[s[idx]] > int[s[idx - 1]] && idx > 0
      result += int[s[idx]] - int[s[idx - 1]]
      idx -= 1
    else
      result += int[s[idx]]
    end

    idx -= 1
  end
  
  result
end

p roman_to_int("DCXXI")