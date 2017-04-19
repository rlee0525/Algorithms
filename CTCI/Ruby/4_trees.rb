# Graph
class Vertex
  attr_reader :in_edges, :out_edges, :value

  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end
end

class Edge
  attr_reader :to_vertex, :from_vertex, :weight

  def initialize(from_vertex, to_vertex, weight = 1)
    @to_vertex = to_vertex
    @from_vertex = from_vertex
    @weight = weight

    @to_vertex.in_edges << self
    @from_vertex.out_edges << self
  end

  def destroy!
    self.to_vertex.in_edges.delete(self)
    self.from_vertex.out_edges.delete(self)
    self.to_vertex = nil
    self.from_vertex = nil
  end

  protected

  attr_writer :to_vertex, :from_vertex, :weight
end

# Test Graph
a = Vertex.new(1)
b = Vertex.new(2)
c = Vertex.new(3)
d = Vertex.new(4)
e = Vertex.new(5)
f = Vertex.new(6)
Edge.new(a, b)
Edge.new(c, d)
Edge.new(e, f)
Edge.new(a, d)
Edge.new(b, e)
Edge.new(a, c)

# Time O(N)
# Space O(N)
# BFS using queue!
def route_nodes(start_vertex, end_vertex)
  return true if start_vertex == end_vertex

  queue = [start_vertex]
  visited = {}

  until queue.empty?
    current = queue.shift

    current.out_edges.each do |edge|
      return true if edge.to_vertex == end_vertex

      unless visited[edge.to_vertex]
        queue << edge.to_vertex
      end
    end

    visited[current] = true
  end

  false
end

p route_nodes(c, a) == false
p route_nodes(a, c) == true

# Time O(N)
# Space O(N)
# DFS using stack!
def route_nodes_rec(start_vertex, end_vertex)
  return true if start_vertex == end_vertex

  visited ||= {}
  visited[start_vertex] = true

  start_vertex.out_edges.each do |edge|
    unless visited[edge.to_vertex]
      return true if route_nodes_rec(edge.to_vertex, end_vertex)
    end
  end

  false
end

p route_nodes_rec(c, a) == false
p route_nodes_rec(a, c) == true
