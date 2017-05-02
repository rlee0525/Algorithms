string = "<html><head></head><div><div></div></div></html>"
# 0 => html, parent = html. count = 0
# 1 => head, parent = html. count = 0 => 1
# 2 => /head, parent = html. count = 1 => 0
# 3 => div, parent = html. count = 0 => 1
# 4 => div, parent = div. count = 1 => 2
#
#
# html
#   head
#   /head
#   div
#     div

class Tree
  attr_accessor :value, :children

  def initialize(value)
    @value = value
    @children = []
  end
end

def html_parser(string)
  splitted = string.split("<")
  root = Tree.new("<" + splitted[1])
  parent_node = root
  count = 0

  i = 2
  while i < splitted.length
    if splitted[i][0] != "/" && count == 0
      new_node = Tree.new("<" + splitted[i])
      parent_node.children << new_node
      count += 1
    elsif splitted[i][0] != "/" && count > 0
      new_node = Tree.new("<" + splitted[i])
      parent_node.children << new_node
      parent_node = parent_node.children[-1] if parent_node
      count += 1
    elsif splitted[i][0] == "/"
      parent_node = parent_node.children[-1] if parent_node
      count -= 1
    end
    i += 1
  end

  root
end

p html_parser(string)
