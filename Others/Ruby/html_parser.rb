string = "<html><head></head><div><div></div></div></html>"

class Tree
  attr_accessor :value, :children

  def initialize(value)
    @value = value
    @children = []
  end
end

def html_parser(string)
  splitted = string.split("<")
  root = Tree.new("<" + splitted[0])
  parent_node = root

  i = 1
  while i < splitted.length
    if splitted[i][0] != "/"
      parent_node.children << ("<" + splitted[i])
    else

    end
    i += 1
  end

  root
end

p html_parser(string)
