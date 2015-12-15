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

class Stack
  attr_accessor :data, :list

  def initialize
    @data = nil
  end

  def push(value)
    zlist = LinkedListNode.new(value, @data)
    @data = zlist
  end

  def pop
    list_top = @data
    @data = @data.next_node
    list_top
  end

  def self.reverse_list(list)
    new_list = Stack.new

    while list
      list_top = list.value
      new_list.push(list_top)
      list = list.next_node
    end
    
    new_list
  end

end
=begin
def reverse_list(list)
  new_list = Stack.new

  while list
    list_top = list.value
    new_list.push(list_top)
    list = list.next_node
  end
    
  new_list
end
=end


node1 = Stack.new
node1.push(14)
node1.push(15)
node1.push(16)

x = reverse_list(node1)
y = x.pop
puts y.value




=begin
node3 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node3)
node1 = LinkedListNode.new(12, node2)

print_values(node1)

node3.push(23)

print_values(node1)
=end