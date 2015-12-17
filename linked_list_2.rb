class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end
 
def print_values(list_node)
  print "#{list_node.value} --> "
  if list_node.next_node.nil?
    print "nil\n"
    return
  else
    print_values(list_node.next_node)
  end
end

def revlist(item)

  current_item = item
  next_item = current_item.next_node
  current_item.next_node = nil

  while next_item
    last_item = current_item
    current_item = next_item
    next_item = current_item.next_node
    current_item.next_node = last_item
  end

  current_item
end
 
node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

x = revlist(node3)

print_values(x)





