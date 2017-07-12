# Implement atoi to convert a string to an integer.

# Hint: Carefully consider all possible input cases. If you want a challenge, please do not see below and ask yourself what are the possible input cases.

# Notes: It is intended for this problem to be specified vaguely (ie, no given input specs). You are responsible to gather all the input requirements up front.

# Update (2015-02-10):
# The signature of the C++ function had been updated. If you still see your function signature accepts a const char * argument, please click the reload button  to reset your code definition.

def my_atoi(str)
  bignum = 2 ** 31 - 1
  smallnum = -2 ** 31

  if str.to_i >= bignum
    bignum
  elsif str.to_i < smallnum
    smallnum
  else
    str.to_i
  end
end
