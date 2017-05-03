def wordLadder(begin_word, end_word, word_list)
  transform_count = 0

end

begin_word = "hit"
end_word = "cog"
word_list = ["hot", "dot", "dog", "lot", "log", "cog"]

# shortest: "hit" -> "hot" -> "dot" -> "dog" -> "cog"

p wordLadder(begin_word, end_word, word_list) == 5
