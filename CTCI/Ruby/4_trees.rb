# Graph
class Vertex
  attr_reader :value, :in_edges, :out_edges

  def initialize(value)
    @value, @in_edges, @out_edges = value, [], []
  end
end

class Edge
  attr_reader :to_vertex, :from_vertex, :weight

  def initialize(to_vertex, from_vertex, weight = 1)
    self.from_vertex = from_vertex
    self.to_vertex = to_vertex
    self.weight = weight

    self.from_vertex.out_edges << self
    self.to_vertex.in_edges << self
  end

  def destroy!
    self.from_vertex.out_edges.delete(self)
    self.from_vertex = nil
    self.to_vertex.in_edges.delete(self)
    self.to_vertex = nil
  end

  protected

  attr_writer :from_vertex, :to_vertex, :weight
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
