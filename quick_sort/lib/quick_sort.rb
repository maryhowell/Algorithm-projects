class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1

    pivot_index = (array.length / 2).to_i
    pivot_value = array[pivot_index]
    array.delete_at(pivot_index)

    lesser = Array.new
    greater = Array.new

     array.each do |x|
       if x <= pivot_value
         lesser << x
       else
         greater << x
       end
     end

    quicksort(lesser) + [pivot_value] + quicksort(greater)

  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)

    prc ||= Proc.new { |a, b| a <=> b }

    return array if length < 2

    pivot_idx = partition(array, start, length, &prc)

    left_length = pivot_idx - start
    right_length = length - (left_length + 1)
    sort2!(array, start, left_length, &prc)
    sort2!(array, pivot_idx + 1, right_length, &prc)

    array

  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    bound = start

    ((start + 1)..(start + length - 1)).to_a.each do |idx|
      if prc.call(array[start], array[idx]) == 1 && idx - bound >= 1
        array[idx], array[bound + 1] = array[bound + 1], array[idx]
        bound += 1
      elsif prc.call(array[start], array[idx]) == 1
        bound += 1
      end
    end
    array[start], array[bound] = array[bound], array[start]
    start = bound
  end
end
