class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  while list_node
    x = list_node.pop
    print "#{x.value} --> "
    if x.next_node.nil?
      print "nil\n"
      return
    end
  end
end

class Stack
  attr_reader :data, :value, :next_node

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


end

def reverse_list(list)
  new_stack = Stack.new
  x = list.pop

  while x
    new_stack.push(x.value)
    x = x.next_node
  end
    
  new_stack
end

node1 = Stack.new
node1.push(14)
node1.push(15)
node1.push(16)
node1.push(17)

fudge = reverse_list(node1)
print_values(fudge)
