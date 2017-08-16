class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    unless self.key == nil
      @prev.next = @next
      @next.prev = @prev
      @prev, @next = nil, nil
    end
  end
end

class LinkedList
  def initialize
    @head = Node.new()
    @tail = Node.new()
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @head.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    self.each do |el|
      return el.val if el.key == key
    end
  end

  def include?(key)
    self.each do |el|
      return true if el.key == key
    end
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)

    new_node.next = @tail
    new_node.prev = @tail.prev

    @tail.prev.next = new_node
    @tail.prev = new_node

    new_node
  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
        return node
      end
    end
    nil
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        node.remove
        return node
      end
    end
  end

  def each
    current = @head.next
    until current == @tail
      yield(current)
      current = current.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
