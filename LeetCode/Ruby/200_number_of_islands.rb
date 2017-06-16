# Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

# Example 1:

# 11110
# 11010
# 11000
# 00000
# Answer: 1

# Example 2:

# 11000
# 11000
# 00100
# 00011
# Answer: 3

# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  count = 0

  grid.each_with_index do |row, idx|
    row.each_with_index do |char, idx2|
      if grid[idx][idx2] == "1"
        check_surroundings(grid, idx, idx2)
        count += 1
      end
    end
  end
  
  count
end

def check_surroundings(grid, row, col)
  return if row < 0 || col < 0 || row >= grid.length || col >= grid[row].length
  return if grid[row][col] == "0"

  grid[row][col] = "0"
  check_surroundings(grid, row, col + 1)
  check_surroundings(grid, row + 1, col)
  check_surroundings(grid, row - 1, col)
  check_surroundings(grid, row, col - 1)
end