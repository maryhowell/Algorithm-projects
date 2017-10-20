# Note: Try to solve this task in O(n) time using O(1) additional space, where
#  n is the number of elements in the list, since this is what you'll be asked to
#  do during an interview.
#
# Given a singly linked list of integers l and an integer k, remove all elements
#  from list l that have a value equal to k.


# Definition for singly-linked list:
# class ListNode
#   attr_accessor :value, :next
#   def initialize(val)
#     @value = val
#     @next = nil
# end
#
def removeKFromList(l, k)
    return [] unless l

    while l.value == k && l.next
        l = l.next
    end

    return [] if l.value == k

    last = l
    current = last.next

    while current
       if current.value == k
           last.next = current.next
       else
           last = last.next
       end
        current = current.next
    end
    l
end
