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

def route_nodes(start_vertex, end_vertex)
  return true if start_vertex == end_vertex

  queue = [start_vertex]
  visited = []

  until queue.empty?
    current = queue.shift
    current.out_edges.each do |edge|
      unless visited.include?(edge.to_vertex)
        return true if edge.to_vertex == end_vertex
        queue << edge.to_vertex
      end
    end

    visited << current
  end

  false
end

def route_nodes_rec(start_vertex, end_vertex)
  return true if start_vertex == end_vertex
  @visited ||= {}
  @visited[start_vertex] = true

  start_vertex.out_edges.each do |edge|
    unless @visited[edge.to_vertex]
      return true if route_nodes_rec(edge.to_vertex, end_vertex)
    end
  end

  false
end
