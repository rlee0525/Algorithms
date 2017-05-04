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
