class Node
  attr_accessor :value

  def initialize(value)
    @value = value
    @next = nil
    @prev = nil
  end
end
