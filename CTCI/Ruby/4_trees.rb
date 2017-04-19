# Graph
class Vertex
  attr_reader :in_edges, :out_edges, :value

  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end
end

class Edges
  attr_reader :to_vertex, :from_vertex, :weight

  def initialize(to_vertex, from_vertex, weight = 1)
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
