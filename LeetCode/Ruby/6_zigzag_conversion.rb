# The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

# P   A   H   N
# A P L S I I G
# Y   I   R
# And then read line by line: "PAHNAPLSIIGYIR"
# Write the code that will take a string and make this conversion given a number of rows:

# string convert(string text, int nRows);
# convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".

# 0        8
# 1     7  9
# 2   6   10
# 3 5     11
# 4       12...

def convert(s, num_rows)
  return s if num_rows == 1

  rows = Array.new(num_rows, "")
  pattern = num_rows * 2 - 2

  s.chars.each_with_index do |char, idx|
    if idx % pattern >= num_rows
      rows[(pattern - idx % pattern)] += char
    else
      rows[idx % pattern] += char
    end
  end
  
  rows.join
end