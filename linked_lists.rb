class LinkedList
  attr_reader :list
  def initialize
    @list = []
    @head = nil
  end

  def append(value)
    node = Node.new(value)
    last_node = @list[-1]
    last_node.next_node = node if !@list.empty?
    @list << node
  end

  def prepend(value)
    node = Node.new(value)
    @list = [node] + @list
    node.next_node = @list[1]
  end

  def size
  end

  def head
    @list[0]
  end

  def tail
    @list[-1]
  end

  def at(index)
  end

  def pop
  end

  def contains?(value)
  end

  def find(value)
  end

  def to_s
  end

end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

newList = LinkedList.new()
newList.append(3)
newList.append('q')
newList.prepend(33)

newList.list.each do |el|
  p el
  p ''
end