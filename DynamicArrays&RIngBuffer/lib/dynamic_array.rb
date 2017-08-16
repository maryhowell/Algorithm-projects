require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    check_index(index)
    store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" unless length > 0
    @length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length == @capacity

    @length += 1
    # @store[@length - 1] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length < 1
    result = @store[0]
    moves = @length
    moves.times do |i|
      @store[i] = @store[i + 1]
    end
    @length -= 1
    result
  end

    # if length == 0
    #  raise "index out of bounds"
    # else
    #    duplicate = StaticArray.new(@capacity)
    #    (@length - 1).times do |i|
    #      duplicate[i] = @store[i + 1]
    #    end
    #    @store = duplicate
    #    @length -= 1
    # end
  # end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if @length == @capacity
    moves = @length
    moves.downto(0) do |i|
      @store[i + 1] = @store[i]
    end

    @store[0] = val
    @length += 1
    @store



    # (@length - 2).downto(0).each { |i| self[i + 1] = self[i] }
    # self[0] = val

  end

  protected

  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    unless (index >= 0) && (index < length)
      raise "index out of bounds"
    end
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_capacity = @capacity * 2
    new_store = StaticArray.new(new_capacity)

    @length.times { |i| new_store[i] = self[i] }

    @capacity = new_capacity
    @store = new_store
  end
end
