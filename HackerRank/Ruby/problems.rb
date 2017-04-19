object = [
  {"id": 1, "name": "San Francisco Bay Area", "parent_id": nil },
  {"id": 2, "name": "San Jose", "parent_id": 3 },
  {"id": 3, "name": "South Bay", "parent_id": 1 },
  {"id": 4, "name": "San Francisco", "parent_id": 1 },
  {"id": 5, "name": "Manhattan", "parent_id": 6 },
  {"id": 6, "name": "New York", "parent_id": nil }
]

def select_field(object)
  hash = Hash.new { |h, k| h[k] = [] }

  object.each do |obj|
    hash[obj[:parent_id]] << obj
  end

  hash.each do |k, v|
    hash[k] = v.sort_by { |obj| obj[:name] }
  end

  hash[nil].each do |parent|
    puts parent[:name]
    print_children(hash, parent[:id], 1)
  end

  hash
end

def print_children(hash, id, level)
  return unless hash[id]

  hash[id].each do |child|
    print "-" * level
    puts child[:name]
    print_children(hash, child[:id], level + 1)
  end
end

select_field(object)
