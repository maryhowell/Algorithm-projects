class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(@max)
  end

  def insert(num)
    is_valid?(num)
   @store[num] = true
  end

  def remove(num)
    is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    is_valid?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    raise "Out of bounds" unless num.between?(0, @max)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num].push(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if count == num_buckets
      resize!
      insert(num)
    else
      @count += 1
      self[num].push(num)
    end
  end

  def remove(num)
    @count -= 1
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { Array.new }
    @store.each do |bucket|
      bucket.each do |i|
        new_store[i % new_store.length].push(i)
      end
    end
    @store = new_store
  end
end
