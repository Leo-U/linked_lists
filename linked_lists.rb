class LinkedList
  attr_reader :list

  def initialize
    @list = []
  end

  def append(value)
    node = Node.new(value)
    last_node = @list[-1]
    last_node.next_node = node unless @list.empty?
    @list << node
  end

  def prepend(value)
    node = Node.new(value)
    @list = [node] + @list
    node.next_node = @list[1]
  end

  def size
    @list.length
  end

  def head
    @list[0]
  end

  def tail
    @list[-1]
  end

  def at(index)
    if !@list[index].nil?
      @list[index]
    else
      raise 'Specified index is out of bounds'
    end
  end

  def pop
    @list[-2].next_node = nil unless @list[-2].nil?
    pop_me = @list[-1]
    @list -= [pop_me]
    pop_me
  end

  def contains?(value)
    @list.each do |el|
      return true if el.value == value
    end
    false
  end

  def find(value)
    @list.each_with_index do |el, i|
      return i if el.value == value
    end
    nil
  end

  def to_s
    string = ''
    @list.each_with_index do |el, i|
      i == 0 ? string = "( #{el.value} )" : string += " -> ( #{el.value} )"
    end
    string += ' -> nil' if string != ''
  end

  def insert_at(value, index)
    if index >= 0 && index <= @list.size
      last_node = @list[index - 1]
      node = Node.new(value)
      node.next_node = @list[index]
      @list.insert(index, node)
      last_node.next_node = node if @list.length > 1 && index - 1 >= 0
    else
      raise 'Specified index is out of bounds'
    end
  end

  def remove_at(index)
    if !@list[index].nil?
      last_node = @list[index - 1]
      last_node.next_node = @list[index + 1]
      @list.delete_at(index)
    else
      raise 'Specified index is out of bounds'
    end
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

newList = LinkedList.new
newList.append(33)
newList.append(7)
newList.append('z')
newList.append('q')

newList.insert_at('foo', 5)

def test_next_node(newList)
  newList.list.each do |el|
    puts "value: #{el.value}"
    puts el.next_node ? "next node: #{el.next_node.value}" : 'next node: nil'
    puts ''
  end
end

test_next_node(newList)
