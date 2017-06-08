# Reverse the digits of the given integer.
#
# Example
#
# For x = 12345, the output should be
# reverseInteger(x) = 54321;
# For x = -4243, the output should be
# reverseInteger(x) = -3424.
# Input/Output
#
# [time limit] 4000ms (rb)
# [input] integer x
#
# Guaranteed constraints:
# -901000 ≤ x ≤ 901000.
#
# [output] integer

def reverseInteger(x)
  reversed = x.to_s.reverse.to_i
  x >= 0 ? reversed : reversed * -1
end
