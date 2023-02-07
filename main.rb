require_relative 'lib/linked_list_class'
require_relative 'lib/node_class'
newList = LinkedList.new
newList.append(33)
newList.append(7)
newList.append('z')
newList.append('q')

newList.insert_at('foo', 4)

def test_next_node(newList)
  newList.list.each do |el|
    puts "value: #{el.value}"
    puts el.next_node ? "next node: #{el.next_node.value}" : 'next node: nil'
    puts ''
  end
end

test_next_node(newList)
