# Version one - Find a path.
def wordLadder(begin_word, end_word, word_list)
  transform_count = 0
  current_word = begin_word
  queue = word_list
  visited_count = 0

  until queue.empty? || visited_count == queue.length
    queue.delete(current_word) if queue.include?(current_word)
    next_word = queue.shift
    if oneLetter(current_word, next_word)
      transform_count += 1
      current_word = next_word
      visited_count = 0
    else
      queue << next_word
      visited_count += 1
    end

    break if current_word == end_word
  end

  if current_word == end_word
    transform_count
  else
    0
  end
end

def oneLetter(word1, word2)
  difference = 0

  (0...word1.length).each do |idx|
    difference += 1 if word1[idx] != word2[idx]
    return false if difference > 1
  end

  true
end

begin_word = "hit"
end_word = "cog"
word_list = ["hot", "dot", "dog", "lot", "log", "cog"]

# shortest: "hit" -> "hot" -> "dot" -> "dog" -> "cog"

p wordLadder(begin_word, end_word, word_list) == 5

# Version 2 - Find the shortest version
def wordLadder2(beginWord, endWord, wordList)
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
      if oneLetter(current_word, word) && !visited[word]
        queue << [word, count + 1]
        visited[word] = true

        return count + 1 if word == endWord
      end
    end
  end

  0
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

p wordLadder2(beginWord, endWord, wordList) #== 5
