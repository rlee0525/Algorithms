def route_nodes(start_node, end_node)
  queue = [start_node]
  visited = []

  until queue.empty?
    current = queue.shift
    current.next_nodes.each do |node|
      unless visited.include?(node)
        if node == end_node
          return true
        else
          queue << node
        end
      end
    end
  end

  false
end
