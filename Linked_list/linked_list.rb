class LinkedList

  def initialize
    @head = nil
    @tail = nil
  end

  #append adds a new node to the end of the list
  def append(node_value = nil)
    node = Node.new(node_value)
    if @tail.nil?
      @head = node
    else
      @tail.next_node = node
    end
    @tail = node
  end

  #prepend adds a new node to the start of the list
  def prepend(node_value = nil)
    node = Node.new(node_value)
    if @head.nil?
      @tail = node
    else
      node.next_node = @head
    end
    @head = node
  end

  #size returns the total number of nodes in the list
  def size
    return 0 if @head.nil?

    quantity = 1
    node = @head
    until node.next_node.nil?
      quantity += 1
      node = node.next_node
    end

    quantity
  end

  #head returns the first node in the list
  def head
    @head
  end

  #tail returns the last node in the list
  def tail
    @tail
  end

  #at(index) returns the node at the given index
  def at(index)
    node = @head
    index.times do
      node = node.next_node
      return nil if node.nil?
    end
    node
  end

  #pop removes the last element from the list
  def pop
    return nil if @head == nil

    node = @head
    poped = @tail
    if @head == @tail
      @head = nil
      @tail = nil
    else
      until node.next_node == @tail
        node = node.next_node
      end

      @tail = node
      @tail.next_node = nil
    end

    poped
  end

  #contains? returns true if the passed in value is in the list and otherwise
  #returns false.
  def contains?(val)
    return nil if @head == nil

    result = false

    node = @head
    until node.next_node.nil?
      if node.value == val
        result = true
        break
      end
      node = node.next_node
    end

    result
  end

  #find(data) returns the index of the node containing data, or nil if not found
  def find(data)
    return nil if @head == nil

    index = 0
    found = false
    node = @head
    until node.next_node.nil?
      if node.value == data
        found = true
        break
      end
      index += 1
      node = node.next_node
    end

    found = true if node.value == data # to account for the last node
    index = nil unless found
    index
  end

  #to_s represent your LinkedList objects as strings, so you can print them
  #out and preview them in the console. The format should be:
  #( data ) -> ( data ) -> ( data ) -> nil
  def to_s
    return "-> nil" if @head == nil

    node = @head

    string = ""
    until node.next_node.nil?
      string << "( #{node.value} ) -> "
      node = node.next_node
    end

    string << "( #{@tail.value} ) -> nil"

    string
  end

  #insert_at(index) that inserts the node at the given index
  def insert_at(index, node_value)
    if index == 0
      node = Node.new(node_value)
      node.next_node = @head
      @head = node
    else
      target = at(index)
      if target.nil?
        append(node_value)
      else
        node = Node.new(node_value)
        pre_target = at(index - 1)
        node.next_node = target
        pre_target.next_node = node
      end
    end

    node
  end

  #remove_at(index) that removes the node at the given index. (You will need to
  #update the links of your nodes in the list when you remove a node.)
  def remove_at(index)
    removed = nil
    if index == 0
      removed = @head
      node = @head.next_node
      @head = node
    else
      target = at(index)
      unless target.nil?
        if target == @tail
          removed = pop
        else
          pre_target = at(index - 1)
          post_target = target.next_node
          pre_target.next_node = post_target
          removed = target
        end
      end
    end

    removed
  end

  class Node
    attr_reader :value
    attr_accessor :next_node

    def initialize(value)
      @value = value
      @next_node = nil
    end

    def to_s
      @value
    end
  end
end
