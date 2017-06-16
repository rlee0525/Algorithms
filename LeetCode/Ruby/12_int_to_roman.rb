# Given an integer, convert it to a roman numeral.

# Input is guaranteed to be within the range from 1 to 3999.

# @param {Integer} num
# @return {String}
def int_to_roman(num)
    roman = {
      0 => "",
      1 => "I",
      5 => "V",
      10 => "X",
      50 => "L",
      100 => "C",
      500 => "D",
      1000 => "M"
    }

    converted = ""
    len = num.to_s.length

    while len > 0
      current = num / (10 ** (len - 1))

      if current == 9
        converted += roman[10 ** (len - 1)] + roman[10 ** len]
      elsif current == 4
        converted += roman[10 ** (len - 1)] + roman[5 * 10 ** (len - 1)]
      else
        if current >= 5
          converted += roman[5 * 10 ** (len - 1)]
          current -= 5
        end
        
        converted += roman[10 ** (len - 1)] * current
      end
      
      num = num % (10 ** (len - 1))
      len -= 1
    end

    converted
end

p int_to_roman(99)
