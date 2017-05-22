def is_valid_sudoku(board)
  cols = Array.new(9) { [] }
  squares = Array.new(9) { [] }

  board.each_with_index do |row, r_idx|
    row.chars.each_with_index do |val, c_idx|
      cols[c_idx] << val
      squares[(3 * (r_idx / 3) + (c_idx / 3))] << val
    end
  end

  board.each_with_index do |row, idx|
    seen = {}
    row.chars.each do |char|
      return false if seen[char]
      seen[char] = true unless char == "."
    end
  end

  cols.each_with_index do |col, idx|
    seen = {}
    col.each do |char|
      return false if seen[char]
      seen[char] = true unless char == "."
    end
  end

  squares.each_with_index do |square, idx|
    seen = {}
    square.each do |char|
      return false if seen[char]
      seen[char] = true unless char == "."
    end
  end
  
  true
end

board = [".87654321","2........","3........","4........","5........","6........","7........","8........","9........"]

p is_valid_sudoku(board) == true