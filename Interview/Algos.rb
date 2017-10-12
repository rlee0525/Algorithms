# 2nd smallest integer
def secondSmallest(arr)
  smallest = 1.0/0.0
  second = 1.0/0.0

  arr.each do |el|
    if el < smallest
      second = smallest
      smallest = el
    elsif el < second
      second = el
    end
  end

  second
end

arr = [2, 10, 4, 35, -1, 20, 33, 100]
p secondSmallest(arr) == 2

# Parse object
def parseObj(obj)
  res = []

  obj.each do |k, v|
    if v.is_a?(String)
      res << v
    elsif v.is_a?(Integer)
      res << ""
    else
      res << parseObj(v)
    end
  end

  res.join(", ")
end

json = {
  "Name" => "Raymond Lee",
  "Position" => "Software Engineer",
  "Details" => {
    "id" => "25",
    "Alma mater" => "Northwestern University",
    "Nothing" => 300
  }
}

p parseObj(json) == "Raymond Lee, Software Engineer, 25, Northwestern University, "