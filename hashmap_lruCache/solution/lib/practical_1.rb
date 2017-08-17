# Given a doubly linked list, like the one you built, reverse it.
# You can assume that this method is monkey patching the LinkedList class
# that you built, so any methods and instance variables in that class
# are available to you.

class LinkedList
  # ....

  def reverse
    # take linked LinkedList
    # until first node == last
    # set prev to next && set next to prev
    # return new LinkedList in new order

      original_first = first
      pointer = @head
      until original_first == last
          # set prev to next && next to prev until original first is the last
        new_last = last.prev
        new_first = last

        pointer.next = new_first
        new_first.prev = pointer

        @tail.prev = new_last
        new_last.next = @tail
        pointer = new_first
      end

      pointer.next = last
      last.prev = pointer

  end
end


# lots of swapping of pointers
# keep a pointer of where you are in the LinkedList
