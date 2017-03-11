#Graph
class Vertex
  attr_reader :value, :in_edges, :out_edges

  def initialize(value)
    @value, @in_edges, @out_edges = value, [], []
  end
end

class Edge
  attr_reader :from_vertex, :to_vertex, :weight

  def initialize(from_vertex, to_vertex, weight)
    self.from_vertex = from_vertex
    self.to_vertex = to_vertex
    self.weight = weight

    self.from_vertex.out_edges << self
    self.to_vertex.in_edges << self
  end

  def destory!
    self.from_vertex.out_edges.delete(self)
    self.from_vertex = nil
    self.to_vertex.in_edges.delete(self)
    self.to_vertex = nil
  end

  protected

  attr_writer :from_vertex, :to_vertex, :weight
end
