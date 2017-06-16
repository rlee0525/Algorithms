# Write a function to find the longest common prefix string amongst an array of strings.

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.empty?

  shortest_string = strs[0]

  strs.each do |str|
    shortest_string = str if str.length < shortest_string.length
  end
  
  prefix = ""

  (0...shortest_string.length).each do |idx|
    if strs.all? { |str| str[idx] == shortest_string[idx] }
      prefix += shortest_string[idx]
    else
      return prefix
    end
  end
  
  prefix
end