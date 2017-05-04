# Find the shortest version
def wordLadder(beginWord, endWord, wordList)
  visited = {}
  queue = [beginWord]
  count = 1

  until queue.empty? || count > wordList.length
    current_word = queue.shift

    if current_word.is_a?(Array)
      count = current_word[1]
      current_word = current_word[0]
    end

    wordList.each do |word|
      if !visited[word] && oneLetter(current_word, word)
        queue << [word, count + 1]
        visited[word] = true

        return count + 1 if word == endWord
      end
    end
  end

  0
end

def oneLetter(word1, word2)
  difference = 0

  (0...word1.length).each do |idx|
    difference += 1 if word1[idx] != word2[idx]
    return false if difference > 1
  end

  true
end

#
# ["hot", "mit", "dot", "dog", "lot", "log", "cog"]
#
# current = "hit"
# next = ["hot", 1], ["mit", 1] (delete these)
# next = {["hot", 1]: ["dot", 2] : ["dog", 3], ["cog", 4]
#                   : ["lot", 2] : ["log", 3], ["cog", 4]
#
# 1) put everything into a queue
# 2) find all the adjacaent words (one letter difference) and count of transformation for that specific chain
# 3) store all of them in an array
# 4) pick the one with lowest transformation count

beginWord = "hit"
endWord = "cog"
wordList = ["hot", "dot", "dog", "lot", "log", "cog"]

p wordLadder(beginWord, endWord, wordList) == 5


def visiblePoints(points)
  
end

# 1. get upper bound (slope)
# 2. get lower bound (slope)
# 3. iterate through 360
# 4. iterate through points array - compare x and y to see if they are visible
# 5. count the numbers
# 6. replace max every time greater is found
# 7. return max

points = [
  [ 1,  1], [ 3,  1], [ 3,  2], [ 3,  3],
  [ 1,  3], [ 2,  5], [ 1,  5], [-1, -1],
  [-1, -2], [-2, -3], [-4, -4]
]

p visiblePoints(points) #== 6
