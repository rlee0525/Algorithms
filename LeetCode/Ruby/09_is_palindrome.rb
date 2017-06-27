Determine whether an integer is a palindrome. Do this without extra space.

def is_palindrome(x)
  x = x.to_s
  (0...x.length / 2).each do |idx|
    return false if x[idx] != x[x.length - idx - 1]
  end
  
  true
end

def is_palindrome(x)
    return false if x < 0 || (x != 0 && x % 10 == 0)
    
    rev = 0
    
    while x > rev
        rev = rev * 10 + x % 10
        x = x / 10
    end
    
    x == rev || x == rev / 10
end
